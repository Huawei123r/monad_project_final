// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/MyFirstNFT.sol";

contract DeployMyFirstNFT is Script {
    function run() public returns (MyFirstNFT) {
        vm.startBroadcast();
        MyFirstNFT myFirstNFT = new MyFirstNFT();
        vm.stopBroadcast();
        return myFirstNFT;
    }
}
