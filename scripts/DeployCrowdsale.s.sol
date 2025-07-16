// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyToken, Crowdsale} from "../contracts/Crowdsale.sol";

contract DeployCrowdsale is Script {
    function run() public returns (MyToken, Crowdsale) {
        vm.startBroadcast();

        // Deploy MyToken first
        MyToken myToken = new MyToken(1000000 * 10 ** 18); // 1,000,000 tokens with 18 decimals

        // Deploy Crowdsale contract
        uint256 rate = 100; // 100 tokens per ETH
        uint256 cap = 100 ether; // 100 ETH cap
        Crowdsale crowdsale = new Crowdsale(rate, address(myToken), cap);

        // Transfer ownership of MyToken to the Crowdsale contract
        myToken.transferOwnership(address(crowdsale));

        vm.stopBroadcast();

        return (myToken, crowdsale);
    }
}
