// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Bank {
    // 需求

	// •	通过 Metamask 向 Bank 合约转账 ETH

	// •	在 Bank 合约记录每个地址转账金额
	// •	编写 Bank 合约 withdraw()，实现提取出所有的 ETH
    // 定义成员变量
    // admin 
    address public admin;
    // 定义mapping 存储所有address 和 对应转入的eth
    mapping(address => uint256) public balances;
    
    // 部署合约执行构造函数，设置管理员账号为部署的合约
    constructor(){
        admin = msg.sender;
    }

    //记录所有转入ETH 的账户和值
    function deposit() public payable {
        require(msg.value<=0, "eth must > 0");
         balances[msg.sender] += msg.value;
    }

    //取款
    function withdrow() public {
        require(msg.sender == admin, "only admin can do");
       payable(admin).transfer(address(this).balance);
    }

    //查询当前余额
    function getBalance() public view returns(uint256){
        return address(this).balance;
    }



}