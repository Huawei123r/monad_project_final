// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Voting} from "../contracts/Voting.sol";

contract DeployVoting is Script {
    function run() public returns (Voting) {
        vm.startBroadcast();
        Voting voting = new Voting();
        vm.stopBroadcast();

        return voting;
    }
}
