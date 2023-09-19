// SPDX-License-Identifier: UNLICENSE
pragma solidity >=0.7.0 <0.9.0;

contract TrafficLight {
    uint256 public a;
    uint256[] public numbers;

    enum LightState { Green, Yellow, Red }

	LightState public currentLight;

	constructor() {
        currentLight = LightState.Red;
	}

    function donate() public payable {
        require(msg.value > 0, "You must send some ETH");
    }

    function addNumber(uint256 _number) public {
        numbers.push(_number);
    }

    function getNumbersCount() public view returns (uint256) {
        return numbers.length;
    }

    function whatsGoingOn() public view returns (uint256) {
        return a;
    }
}