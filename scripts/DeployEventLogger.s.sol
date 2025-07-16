// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {EventLogger} from "../contracts/EventLogger.sol";

contract DeployEventLogger is Script {
    function run() public returns (EventLogger) {
        vm.startBroadcast();
        EventLogger eventLogger = new EventLogger();
        vm.stopBroadcast();

        return eventLogger;
    }
}
