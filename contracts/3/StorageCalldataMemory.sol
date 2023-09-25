// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageCalldataMemory {
    // storage variable: This array is stored on the blockchain
    uint256[] public storageArray;

    // Function that modifies a storage array
    function addToStorageArray(uint256 value) public {
        uint256[] storage storageRef = storageArray; // storage reference type
        storageRef.push(value);
    }

    // Function that uses a calldata array
    // calldata is only available to external functions
    function sumCalldataArray(uint256[] calldata calldataArray) external pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < calldataArray.length; i++) {
            sum += calldataArray[i];  // calldata reference type
        }
        return sum;
    }

    // Function that uses a memory array
    // Memory variables are temporary and erased between external function calls
    function sumMemoryArray(uint256[] memory memoryArray) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < memoryArray.length; i++) {
            sum += memoryArray[i];  // memory reference type
        }
        return sum;
    }
}
