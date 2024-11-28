
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// 选择器冲突的例子
contract Foo {
    function burn(uint256) external {}
    function collate_propagate_storage(bytes16) external {}
}