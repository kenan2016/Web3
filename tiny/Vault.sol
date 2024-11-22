// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Vault{
    using SafeMath for uint256;

    IERC20 public token; // ERC20 Token 合约实例
    mapping(address => uint256) public balances; // 用户存款记录

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress); // 初始化 Token 地址
    }
    
        // 存款方法
    function deposit(uint256 _amount) external {
        require(_amount > 0, "Deposit amount must be greater than zero");
        
        // 从用户地址转移 Token 到合约
        token.transferFrom(msg.sender, address(this), _amount);
        
        // 更新用户的存款余额
        balances[msg.sender] = balances[msg.sender].add(_amount);
    }

    // 提款方法
    function withdraw(uint256 _amount) external {
        require(_amount > 0, "Withdraw amount must be greater than zero");
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        // 更新用户的存款余额
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        
        // 将 Token 转回给用户
        token.transfer(msg.sender, _amount);
    }
}