// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title NFTMarketplace
 * @dev A simple marketplace for buying and selling ERC721 tokens.
 * This contract contains custom logic for listing, buying, and unlisting NFTs.
 */
contract NFTMarketplace is Ownable {
    struct Listing {
        uint256 price;
        address seller;
        bool active;
    }

    mapping(address => mapping(uint256 => Listing)) public listings;

    event NFTListed(address indexed nftContract, uint256 indexed tokenId, uint256 price, address indexed seller);
    event NFTBought(address indexed nftContract, uint256 indexed tokenId, uint256 price, address buyer, address indexed seller);
    event NFTUnlisted(address indexed nftContract, uint256 indexed tokenId);

    constructor() Ownable() {}

    /**
     * @dev Lists an NFT for sale.
     * @param _nftContract The address of the NFT contract.
     * @param _tokenId The ID of the token to list.
     * @param _price The price of the token in wei.
     */
    function listNFT(address _nftContract, uint256 _tokenId, uint256 _price) public {
        require(_price > 0, "Price must be greater than 0");
        IERC721 nft = IERC721(_nftContract);
        require(nft.ownerOf(_tokenId) == msg.sender, "You do not own this NFT");
        // The marketplace contract must be approved to transfer the NFT.
        require(nft.getApproved(_tokenId) == address(this), "Marketplace not approved to transfer NFT");

        listings[_nftContract][_tokenId] = Listing(_price, msg.sender, true);
        emit NFTListed(_nftContract, _tokenId, _price, msg.sender);
    }

    /**
     * @dev Buys an NFT from the marketplace.
     * @param _nftContract The address of the NFT contract.
     * @param _tokenId The ID of the token to buy.
     */
    function buyNFT(address _nftContract, uint256 _tokenId) public payable {
        Listing storage listing = listings[_nftContract][_tokenId];
        require(listing.active, "NFT not listed or already sold");
        require(msg.value >= listing.price, "Insufficient ETH provided");

        IERC721 nft = IERC721(_nftContract);
        
        // Custom Logic: Transfer ETH to the seller and the NFT to the buyer.
        // This includes a check to refund any excess ETH sent with the transaction.
        (bool success, ) = payable(listing.seller).call{value: listing.price}("");
        require(success, "ETH transfer failed");

        nft.transferFrom(listing.seller, msg.sender, _tokenId);

        listing.active = false;
        emit NFTBought(_nftContract, _tokenId, listing.price, msg.sender, listing.seller);

        if (msg.value > listing.price) {
            (success, ) = payable(msg.sender).call{value: msg.value - listing.price}("");
            require(success, "ETH refund failed");
        }
    }

    /**
     * @dev Unlists an NFT from the marketplace.
     * @param _nftContract The address of the NFT contract.
     * @param _tokenId The ID of the token to unlist.
     */
    function unlistNFT(address _nftContract, uint256 _tokenId) public {
        Listing storage listing = listings[_nftContract][_tokenId];
        require(listing.active, "NFT not listed");
        require(listing.seller == msg.sender, "You are not the seller of this NFT");

        listing.active = false;
        emit NFTUnlisted(_nftContract, _tokenId);
    }
}