// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract LogicContract1 {
    function collate_propagate_storage(bytes16 arg) external pure returns (bytes16) {
        return arg;
    }

    function burn(uint256 amount) external pure returns (uint256) {
        return amount;
    }
}