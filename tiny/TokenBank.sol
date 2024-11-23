// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract TokenBank {
    using SafeMath for int256;

    // Token实例，用来在构造函数初始化后，存储Token 地址
    IERC20 token;

    // 存用户地址和用户持有Token数量
    mapping (address => uint256) public user_tokens;

    //构造函数使用参数 _token
    constructor(address tokenAddr) {
        token = IERC20(tokenAddr);
    }

    // 存款
    function deposit(uint256 amount) external {
        require(amount>0,  "token amou must be more than zero");
        //更新用户存款
        user_tokens[msg.sender] += amount;
        // 调用Token存款方法存用户转账数量到 TokenBank 合约 （本合约）
        token.transferFrom(msg.sender, address(this), amount);
    }

    //取款
    function withdraw(uint256 amount) external {
        uint256 balance = user_tokens[msg.sender];
        require(balance > amount,"not enough balance");
        user_tokens[msg.sender] -= amount;
        //转回用户
        token.transfer(msg.sender, amount);
    }
}