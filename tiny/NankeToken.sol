//在remix 中 使用OpenZeppelin创建代币
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract NanKeToken is ERC20 {
    // constructor(string memory name, string memory symbol) ERC20(name,symbol){
    //     // 初始发行 100000 个 Token，注意将数量转换为带 18 位小数的格式
    //     _mint(msg.sender, 100000*10*decimals());
    // }

       constructor() ERC20("nankeToken","nkt"){
        // 初始发行 100000 个 Token，注意将数量转换为带 18 位小数的格式
        _mint(msg.sender, 100000*10*decimals());
    }
}