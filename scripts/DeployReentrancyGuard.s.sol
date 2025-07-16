// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/ReentrancyGuard.sol";

contract DeployReentrancyGuard is Script {
    function run() public returns (Guarded) {
        vm.startBroadcast();
        Guarded guarded = new Guarded();
        vm.stopBroadcast();
        return guarded;
    }
}
