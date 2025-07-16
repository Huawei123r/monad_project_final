// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/SimpleDEX.sol";
import "../contracts/MyFirstToken.sol";
import "../contracts/SecondToken.sol";

contract DeploySimpleDEX is Script {
    function run() public returns (SimpleDEX) {
        vm.startBroadcast();

        // Replace these with the actual deployed addresses of MyFirstToken and SecondToken
        // For now, using placeholder addresses. You would get these from previous deployments.
        address myFirstTokenAddress = 0x46E4cb3B7763a5819B94F18FB1B14fb9B5208790; // Replace with actual MyFirstToken address
        address secondTokenAddress = 0x11C3F7863d7A2cee3BCE4e68B381493b1589EB3d; // Replace with actual SecondToken address

        SimpleDEX simpleDEX = new SimpleDEX(myFirstTokenAddress, secondTokenAddress);
        vm.stopBroadcast();
        return simpleDEX;
    }
}
