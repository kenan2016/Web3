// SPDX-License-Identifier: MIT
pragma solidity <0.8.21;
contract ValueType {
    // 布尔型
    bool public _bool = true;
    // 布尔运算
    bool public _bool1 = 1>1;
    bool public _bool2 = true && false;

    // 整数
    int public _int1 = 1;
    int256 public _int2 =2;
    // 整数运算
    int public _int3 = 1+1;
    int256 public _int4 = 7%2;
    // 地址
    address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    address payable public _address1 = payable(_address);
    // 地址类型的成员
   uint256 public balance = _address1.balance; // balance of address    
   // 固定长度的字节数组
   bytes32 public _byte32 = "Hello World";
    // Enum 枚举
    enum STATE {Buy, Hello, Sale}
    STATE action = STATE.Sale;
        // enum可以和uint显式的转换
    function enumToUint() external view returns(uint){
        return uint(action);
    }
}