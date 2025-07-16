// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyPaymentSplitter} from "../contracts/PaymentSplitter.sol";

contract DeployPaymentSplitter is Script {
    function run() public returns (MyPaymentSplitter) {
        address[] memory payees = new address[](2);
        payees[0] = vm.envAddress("PAYEE1_ADDRESS");
        payees[1] = vm.envAddress("PAYEE2_ADDRESS");

        uint256[] memory shares = new uint256[](2);
        shares[0] = 60;
        shares[1] = 40;

        vm.startBroadcast();
        MyPaymentSplitter paymentSplitter = new MyPaymentSplitter(payees, shares);
        vm.stopBroadcast();

        return paymentSplitter;
    }
}
