// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract A {
    function b() pure public {
        {
            uint x;
            x = 1;
        }

        {
            uint x;
            x = 3;
        }
    }

    function c() public pure returns (uint) {
        uint x = 1;
        {
            x = 2; 
        }
        return x; 
    }

    function d() public pure returns (uint) {
        uint x;
        x = 2;
        return x;
    }
}