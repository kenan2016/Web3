// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Other{
     uint256 private _x = 0;
    // 定义一个事件记录收到eth
    event log(uint amount, uint gas);

    // 返回合约ETH余额
    function getBalance() view public returns (uint) {
        return address(this).balance;
    }

     // 可以调整状态变量_x的函数（转入），并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable {
        // 修改状态变量 
        _x = x;
        if(msg.value >0 ){
            emit log(msg.value, gasleft());
        }
    }

    // 读取_x
    function getLeft() external view returns(uint x){
        x = _x;
    }
    
}