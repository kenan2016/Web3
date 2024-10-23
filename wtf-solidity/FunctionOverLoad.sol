// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
 contract FunOverload{
     function getNum(int256 _in) public pure returns(int256 _out){
       _out =_in;
    }

     function getNum(int8 _in) public pure returns(int256 _out){
       _out =_in;
    }
    
}