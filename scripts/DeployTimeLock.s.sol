// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {TimeLock} from "../contracts/TimeLock.sol";

contract DeployTimeLock is Script {
    function run() public returns (TimeLock) {
        vm.startBroadcast();
        TimeLock timeLock = new TimeLock();
        vm.stopBroadcast();

        return timeLock;
    }
}
