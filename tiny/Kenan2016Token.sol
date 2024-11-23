// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Kenan2016 is ERC20{
    // 给部署合约的用户mint 10w Token
    constructor() ERC20("Kenan2016", "KT") {
        _mint(msg.sender, 100000*10 ** decimals());
     }
}
