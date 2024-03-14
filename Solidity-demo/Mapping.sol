// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract Mapping {
    mapping(int => address) public idToAddr;
    mapping(address => address) public swapAddressMap;

    function writeMap(int _key,address _val) public {
        idToAddr[_key] = _val;
    }
}
