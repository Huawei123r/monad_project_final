// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/MyFirstToken.sol";

contract DeployMyFirstToken is Script {
    function run() public returns (MyFirstToken) {
        vm.startBroadcast();
        MyFirstToken myFirstToken = new MyFirstToken(1000000 * (10 ** 18)); // 1,000,000 tokens with 18 decimals
        vm.stopBroadcast();
        return myFirstToken;
    }
}
