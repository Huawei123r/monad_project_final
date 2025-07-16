// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {SimpleNFT} from "../contracts/SimpleNFT.sol";

contract DeploySimpleNFT is Script {
    function run() public returns (SimpleNFT) {
        vm.startBroadcast();
        SimpleNFT simpleNFT = new SimpleNFT();
        vm.stopBroadcast();

        return simpleNFT;
    }
}
