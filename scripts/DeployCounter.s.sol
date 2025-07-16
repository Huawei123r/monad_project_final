// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/Counter.sol";

contract DeployCounter is Script {
    function run() public returns (Counter) {
        vm.startBroadcast();
        Counter counter = new Counter();
        vm.stopBroadcast();
        return counter;
    }
}
