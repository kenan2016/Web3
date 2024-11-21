// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Count{
     uint256 public num;
    
    function add() public returns (uint256 res){
        num = num+1;
        return num;
    }
}
