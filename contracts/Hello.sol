// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Hello {
    uint256 public sayCount;
    address public owner;

    event Hi(address sender, uint256 sayCount);

    constructor() {
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of
    // the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    function showMe() public view returns (uint256) {
        return sayCount;
    }

    function sayHi() public {
        sayCount++;
        emit Hi(msg.sender, sayCount);
    }

    function reOpen() public onlyOwner {
        sayCount = 0;
    }
}