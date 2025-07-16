// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/TodoList.sol";

contract DeployTodoList is Script {
    function run() public returns (TodoList) {
        vm.startBroadcast();
        TodoList todoList = new TodoList();
        vm.stopBroadcast();
        return todoList;
    }
}
