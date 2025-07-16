// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/TimeLockedWallet.sol";

contract DeployTimeLockedWallet is Script {
    function run() public returns (TimeLockedWallet) {
        vm.startBroadcast();
        TimeLockedWallet timeLockedWallet = new TimeLockedWallet();
        vm.stopBroadcast();
        return timeLockedWallet;
    }
}
