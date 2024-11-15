// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract TestBank{
    // 合约管理员
    address payable public owner;

    // 账户address 和 value 变量
    mapping(address => uint256) public deposits;

    // 调用次数
    uint called;

    //初始化时将外部设置的合约地址设为管理员
    constructor() payable {
        owner = payable(msg.sender);
    }

    // 存款
    function deposit() public payable {
        deposits[msg.sender] += msg.value;
    }

    // 实现一下Receive():当合约收到 eth 时 自动 触发 Receive 实际作用同上（deposit），只是说这个方法会自动触发
    receive() external payable { 
        deposits[msg.sender] += msg.value;
    }

    // fallback 方法
    fallback() external payable { 
        deposits[msg.sender] += msg.value;
        called += 1;
    }

    // 提款
    function withdrawAll() public {
        require(msg.sender==owner,"only owner can do");
        // 校验只有管理员才可调用该方法
        uint amount = address(this).balance;
        (bool success,) = owner.call{value:amount}("");
        require(success,"Failed to send Eth");
    }

    //分别归还各自eth
    function withdraw() public {
       (bool success, ) = msg.sender.call{value:deposits[msg.sender]}("");
        deposits[msg.sender] = 0;
        require( success, "sended failed");
        //将 mapping 对应数据置为0
        // bug
    }


}