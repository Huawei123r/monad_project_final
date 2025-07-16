// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/SecondToken.sol";

contract DeploySecondToken is Script {
    function run() public returns (SecondToken) {
        vm.startBroadcast();
        SecondToken secondToken = new SecondToken(1000000 * (10 ** 18)); // 1,000,000 tokens with 18 decimals
        vm.stopBroadcast();
        return secondToken;
    }
}
