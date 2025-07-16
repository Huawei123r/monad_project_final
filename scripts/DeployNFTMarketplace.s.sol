// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {NFTMarketplace} from "../contracts/NFTMarketplace.sol";
import {MyFirstNFT} from "../contracts/MyFirstNFT.sol";

contract DeployNFTMarketplace is Script {
    function run() public returns (NFTMarketplace, MyFirstNFT) {
        vm.startBroadcast();

        // Deploy a sample NFT contract
        MyFirstNFT myNFT = new MyFirstNFT();

        // Deploy the NFTMarketplace contract
        NFTMarketplace marketplace = new NFTMarketplace();

        vm.stopBroadcast();

        return (marketplace, myNFT);
    }
}
