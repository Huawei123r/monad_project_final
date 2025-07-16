// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    uint256 public amount;
    uint256 public deadline;

    constructor(address _beneficiary, uint256 _deadline) payable {
        depositor = msg.sender;
        beneficiary = _beneficiary;
        amount = msg.value;
        deadline = block.timestamp + _deadline;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function reclaim() public {
        require(msg.sender == depositor, "Only the depositor can reclaim the funds.");
        require(block.timestamp >= deadline, "The deadline has not passed yet.");
        payable(depositor).transfer(amount);
    }

    function release() public {
        require(msg.sender == beneficiary, "Only the beneficiary can release the funds.");
        payable(beneficiary).transfer(amount);
    }
}
