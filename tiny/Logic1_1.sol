// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 透明可升级合约的教学代码，不要用于生产。

// 旧逻辑合约
contract Logic1_1 {
    // 状态变量和proxy合约一致，防止插槽冲突
    address public implementation; 
    address public admin; 
    string public words; // 字符串，可以通过逻辑合约的函数改变

    // 改变proxy中状态变量，选择器： 0xc2985578
    function foo() public{
        words = "old";
    }
}