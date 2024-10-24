// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract FallbackDemo{


      /* 触发fallback() 还是 receive()?
                接收ETH
                    |
                msg.data是空？
                    /  \
                是    否
                /      \
        receive()存在?   fallback()
                / \
            是  否
            /     \
        receive()  fallback   
    */


    //定义事件
    event receiveCalled(address Sender, uint Value);
    event fallbackCalled(address Sender, uint Value, bytes Data);

    // 接受ETH 时候时候放Receive事件
    receive() external payable { 
        emit  receiveCalled(msg.sender, msg.value);
    }


    fallback() external payable{
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }

}