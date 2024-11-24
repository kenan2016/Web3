
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract NFTMarket{
    IERC721 public nftContract;
    IERC20 public  tokenContract;

    struct Listing{
        address seller;
        uint256 price;
    }

    mapping (uint256 =>Listing) public listings;

    // 构造函数里初始化 nftContract、tokenContract，这里说明一下为什么要注入 nftContract、tokenContract
    //因为 需要操作这两个合约实现nft转移，和 Token的转移
    constructor(address nftAddress,address tokenAddress){
       nftContract = IERC721(nftAddress); 
       tokeContract=IERC20(tokenAddress);
    }

    // 上架NFT
    function listNFT(uint256 tokenId, uint256 price) public {
        require(price > 0, "Price must be greater than zero");
        // 校验 铸 nft 的合约，是否 是 该
        require(nftContract.ownerOf(tokenId) == msg.sender, "Only the owner can list the NFT");
        require(
            //检查授权
            nftContract.getApproved(tokenId) == address(this) || nftContract.isApprovedForAll(msg.sender, address(this)),
            "Marketplace not approved"
        );
        // 记录 tokenId 和对应的 Listing （ps:对应的seller 和价格结构体）
        listings[tokenId] = Listing(msg.sender, price);
    }

  // 购买 NFT
    function buyNFT(uint256 tokenId) public {

        Listing memory listing = listings[tokenId];
        require(listing.price > 0, "NFT is not listed for sale");

        // 检查买家的 Token 余额是否足够
        require(tokenContract.balanceOf(msg.sender) >= listing.price, "Insufficient token balance");

        // 转移 Token 到卖家
        tokenContract.transferFrom(msg.sender, listing.seller, listing.price);

        // // 转移 NFT 到买家
        nftContract.safeTransferFrom(listing.seller, msg.sender, tokenId);

        // // 删除上架信息
        delete listings[tokenId];
    }

}