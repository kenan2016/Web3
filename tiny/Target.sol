
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Target {
    uint256 public num;

    function changeNum(uint256 _num) public {
        num = _num;
    }
}

// 调用目标合约 Target，修改其存储变量 num。
contract Caller{
    function callChangeNum(address target, uint256 _num) public {
        (bool success,) = target.call(abi.encodeWithSignature("changeNum(uint256)", _num));
        require(success, "Failed to change number");
    } 

}