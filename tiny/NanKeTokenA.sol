// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NanKeTokenA is ERC20 {
      constructor() ERC20("NankeToken", "NKT") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }
}

