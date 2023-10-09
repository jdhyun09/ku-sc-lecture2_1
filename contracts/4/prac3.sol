// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract C {
    function f(uint8 a, uint8 b) public pure returns (uint8){
        unchecked { return a - b; } //if a=0,b=1, it returns 255
    }
    function g(uint8 a, uint8 b) public pure returns (uint8){
        return a - b;   //if a=0,b=1, an error occurs: revert
    }
}