// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract Overload{
    function saySomething() public pure returns(string memory){
        return "nothing";
    }
    function saySomething(string memory str) public pure returns(string memory){
        return str;
    }
    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }

}