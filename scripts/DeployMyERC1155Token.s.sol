// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyERC1155Token} from "../contracts/MyERC1155Token.sol";

contract DeployMyERC1155Token is Script {
    function run() public returns (MyERC1155Token) {
        vm.startBroadcast();
        MyERC1155Token erc1155Token = new MyERC1155Token();
        vm.stopBroadcast();

        return erc1155Token;
    }
}
