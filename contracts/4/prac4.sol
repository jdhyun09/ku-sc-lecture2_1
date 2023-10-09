// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ParentContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function externalFunc() external pure returns (string memory) {
        return "External function called";
    }

    function publicFunc() public pure returns (string memory) {
        return "Public function called";
    }

    function internalFunc() internal pure returns (string memory) {
        return "Internal function called";
    }

    function privateFunc() private pure returns (string memory) {
        return "Private function called";
    }

    // Function with onlyOwner modifier
    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}

contract ChildContract is ParentContract {
    struct SampleStruct {
        uint256 id;
        string text;
    }

    function testInternalFunc() public pure returns (string memory) {
        return internalFunc();
    }

    // Function returning a struct
    function getStruct() public pure returns (SampleStruct memory) {
        return SampleStruct(1, "Hello");
    }
}
