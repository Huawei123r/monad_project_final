// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/PausableContract.sol";

contract DeployPausableContract is Script {
    function run() public returns (PausableContract) {
        vm.startBroadcast();
        PausableContract pausableContract = new PausableContract();
        vm.stopBroadcast();
        return pausableContract;
    }
}
