// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NankeNFT is ERC721URIStorage{
    // 记录 NFT ID
    uint256 private _currentNFTId;
    //部署后创建一个 NKNFT
    constructor() ERC721("Nanke NFT", "NKNFT") {
        
    }

    // 铸造 NFT 方法 ：用来给每个 address 铸造一个NFT,返回 nftID
    function mint(address to, string memory tokenURI) public returns (uint256) {
        _currentNFTId ++;
        uint256 newNFTId = _currentNFTId;
         _mint(to, newNFTId);
         _setTokenURI(newNFTId, tokenURI);
        return newNFTId;

    } 

}