// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {SimpleToken} from "../contracts/SimpleToken.sol";

contract DeploySimpleToken is Script {
    function run() public returns (SimpleToken) {
        vm.startBroadcast();
        SimpleToken simpleToken = new SimpleToken(1000000000000000000000000);
        vm.stopBroadcast();

        return simpleToken;
    }
}
