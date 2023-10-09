// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GrandParent {
    uint256 public grandParentMoney = 500;

    function getMoney() public view virtual returns (uint256) {
        return grandParentMoney;
    }
}

contract Parent {
    uint256 public parentMoney = 100;

    function getMoney() public view virtual returns (uint256) {
        return parentMoney;
    }
}

contract Child is GrandParent, Parent {
    function getMoney() public view override(GrandParent, Parent) returns (uint256) {
        return grandParentMoney + parentMoney;
    }
}