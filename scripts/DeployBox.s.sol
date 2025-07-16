// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Box} from "../contracts/Box.sol";

contract DeployBox is Script {
    function run() public returns (Box) {
        vm.startBroadcast();
        Box box = new Box(42);
        vm.stopBroadcast();

        return box;
    }
}
