// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Logic{
    uint256 public num;

    function setNum(uint256 _num) public{
        num = _num;
    }
}

contract Proxy {

   uint256 public num;
   address public logic;

    // 这里可以改造成构造函数的写法.
   function setLoic(address _addr) public {
        logic = _addr;
   }

   function execSetNum(uint256 _num) public {
        //修改调用者合约的存储
        (bool success, ) = logic.delegatecall(abi.encodeWithSignature("setNum(uint256)", _num));
        require(success, "Delegatecall failed");
   }
}
