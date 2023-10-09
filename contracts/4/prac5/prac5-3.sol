// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type UFixed16x2 is uint16;

using {
    sub as -
} for UFixed16x2 global;

function sub(UFixed16x2 a, UFixed16x2 b) pure returns (UFixed16x2) {
    return UFixed16x2.wrap(UFixed16x2.unwrap(a) - UFixed16x2.unwrap(b));
}

contract Math {
    function subtraction(UFixed16x2 a, UFixed16x2 b) public pure returns (UFixed16x2) {
        return a - b;
    }
}