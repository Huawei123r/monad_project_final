// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {StakingRewards} from "../contracts/StakingRewards.sol";
import {MyFirstToken} from "../contracts/MyFirstToken.sol";
import {SecondToken} from "../contracts/SecondToken.sol";

contract DeployStakingRewards is Script {
    function run() public returns (StakingRewards) {
        vm.startBroadcast();

        // Use existing token contracts
        MyFirstToken stakingToken = MyFirstToken(0x46E4cb3B7763a5819B94F18FB1B14fb9B5208790);
        SecondToken rewardsToken = SecondToken(0x11C3F7863d7A2cee3BCE4e68B381493b1589EB3d);

        // Deploy StakingRewards contract
        StakingRewards stakingRewards = new StakingRewards(address(stakingToken), address(rewardsToken));

        vm.stopBroadcast();

        return stakingRewards;
    }
}
