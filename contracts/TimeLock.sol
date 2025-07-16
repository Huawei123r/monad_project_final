// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract TimeLock is Ownable {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public lockTime;

    event Deposit(address indexed user, uint256 amount, uint256 lockUntil);
    event Withdraw(address indexed user, uint256 amount);

    constructor() Ownable() {}

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        lockTime[msg.sender] = block.timestamp + 1 weeks; // Lock for 1 week
        emit Deposit(msg.sender, msg.value, lockTime[msg.sender]);
    }

    function withdraw() public {
        require(balances[msg.sender] > 0, "No funds to withdraw");
        require(block.timestamp >= lockTime[msg.sender], "Funds are still locked");

        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");

        emit Withdraw(msg.sender, amount);
    }

    function setLockTime(address user, uint256 newLockTime) public onlyOwner {
        lockTime[user] = newLockTime;
    }
}
