// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {SimpleOracle} from "../contracts/SimpleOracle.sol";

contract DeploySimpleOracle is Script {
    function run() public returns (SimpleOracle) {
        vm.startBroadcast();
        SimpleOracle simpleOracle = new SimpleOracle();
        vm.stopBroadcast();

        return simpleOracle;
    }
}
