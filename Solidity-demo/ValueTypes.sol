// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract ValueTypes {
   // boolean
   bool public flag = true;
   // 布尔运算
   bool public _flage1 = !true;

   bool public _flag2 = !false;

   bool public _flag3 = true && false;

   // 整数
    int public _int1 = 1;

    uint public _uint1 = 1;

    //  运算
    //而 uint256 则是一种明确指定其长度为 256 位的无符号整数类型。
    // 在 Solidity 中，除了 uint256 以外，还有其他的 uint8、uint16、uint32、uint64、uint128 等类型，这些类型都有明确指定的位数
    // 定长 int
    int8 public in8 = 16;

    // 指数运算
    int public res = 2**2;
    bool public _numberbool = 10 > 8; // 比大小

    // address

    address public addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    address payable public _addr1 = payable(addr);
    // 地址类型的成员
    uint256 public balance = _addr1.balance;
    // 定长字节数组
    // 固定长度的字节数组
    bytes32 public _byte32 = "MiniSolidity"; 
    bytes1 public _byte = _byte32[0]; 

    // 5. 枚举 enum
    enum ACTION_ENUM {BUY, HALO,SELL}
    ACTION_ENUM action = ACTION_ENUM.BUY;
    // enum可以和uint显式的转换
    function enumToUint() external view returns(uint){
        return uint(action);
    }
}