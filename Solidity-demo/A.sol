// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// 构造函数的继承
abstract contract A {
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}

contract C is A {
    constructor(uint _c) A(_c * _c) {}
}