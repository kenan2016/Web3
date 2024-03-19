// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract Event {
  
   // 定义_balances映射变量，记录每个地址的持币数量
    mapping(address => uint256) public _balances;

    // 定义事件 Transfer
    event Transfer(address indexed from, address indexed to, uint256 value);
    function _trans(    address from,address to,uint256 amount) external{
        _balances[from] = 10000000; // 给转账地址一些初始代币
        _balances[from] -=  amount; // from地址减去转账数量
        _balances[to] += amount; // to地址加上转账数量
        // 通知事件
        emit Transfer(from, to, amount);
    }

}