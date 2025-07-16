// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {LendingBorrowing} from "../contracts/LendingBorrowing.sol";
import {MyFirstToken} from "../contracts/MyFirstToken.sol";
import {SecondToken} from "../contracts/SecondToken.sol";

contract DeployLendingBorrowing is Script {
    function run() public returns (LendingBorrowing, MyFirstToken, SecondToken) {
        vm.startBroadcast();

        // Deploy Collateral Token
        MyFirstToken collateralToken = new MyFirstToken(1000000 * 10 ** 18); // 1,000,000 tokens

        // Deploy Borrow Token
        SecondToken borrowToken = new SecondToken(1000000 * 10 ** 18); // 1,000,000 tokens

        // Deploy LendingBorrowing contract
        uint256 collateralRatio = 150; // 150%
        uint256 liquidationThreshold = 120; // 120%
        LendingBorrowing lendingBorrowing = new LendingBorrowing(
            address(collateralToken),
            address(borrowToken),
            collateralRatio,
            liquidationThreshold
        );

        vm.stopBroadcast();

        return (lendingBorrowing, collateralToken, borrowToken);
    }
}
