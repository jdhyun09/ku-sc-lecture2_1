// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalledContract {
    address public origin;
    address public sender;

    /// @notice Set the origin and sender addresses
    function setOriginAndSender() public {
        origin = tx.origin;
        sender = msg.sender;
    }
}

contract CallerContract {
    CalledContract public calledContractInstance;

    event Details(string name, address origin, address sender);
    event DelegateCalled(bool success);
    event EtherSent(bool success);

    /// @notice Initialize with the address of a `CalledContract` instance
    /// @param _calledContractAddress The address of `CalledContract`
    constructor(address _calledContractAddress) {
        calledContractInstance = CalledContract(_calledContractAddress);
    }

    /// @notice Make a direct call to set origin and sender
    function callSetOriginAndSender() public {
        calledContractInstance.setOriginAndSender();
        emit Details("Direct Call", tx.origin, msg.sender);
    }

    /// @notice Make a delegate call to set origin and sender
    function delegatecallSetOriginAndSender() public {
        (bool success,) = address(calledContractInstance).delegatecall(
            abi.encodeWithSignature("setOriginAndSender()")
        );
        require(success, "Delegatecall failed");
        emit DelegateCalled(success);
        emit Details("Delegate Call", tx.origin, msg.sender);
    }

    /// @notice Send Ether using the `send` function
    function sendEther() public payable {
        address payable target = payable(address(calledContractInstance));
        bool success = target.send(msg.value);
        require(success, "Send failed");
        emit EtherSent(success);
    }

    /// @notice Send Ether using the `transfer` function
    function transferEther() public payable {
        address payable target = payable(address(calledContractInstance));
        target.transfer(msg.value);
        emit EtherSent(true);
    }
}
