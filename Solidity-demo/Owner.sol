// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract Owner {
    address public owe;
    constructor(address _owe){
        owe = _owe;
    }

    // 定义一个modifier
    modifier onlyOwner(){
        require(owe == msg.sender,"You are not the owner");
        _;
    }

    function changeOwner(address _newOwner) external onlyOwner{
        owe = _newOwner;
    }
}