// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasTest {
    event GasUsed(string operation, uint256 gasUsed);

    /// @notice Check gas used for simple operation
    function simpleOperation() public {
        uint256 initialGas = gasleft();

        uint256 sum = 0;
        for(uint8 i = 0; i < 100; i++) {
            sum += i;
        }

        uint256 finalGas = gasleft();
        uint256 gasUsed = initialGas - finalGas;

        emit GasUsed("simpleOperation", gasUsed);
    }
}