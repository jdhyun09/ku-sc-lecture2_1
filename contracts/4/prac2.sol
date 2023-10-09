// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract B {
    function a() public pure returns (uint, bool, uint){
        return(100,true,1);
    }
    function b() public pure returns (uint, bool, uint){
        (uint x,bool y,uint z) = a();
        return(z,y,x);
    }
}