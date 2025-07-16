// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Faucet {
    address public owner;
    IERC20 public token;
    uint256 public withdrawalAmount;
    mapping(address => uint256) public nextAccessTime;

    constructor(address tokenAddress, uint256 _withdrawalAmount) {
        owner = msg.sender;
        token = IERC20(tokenAddress);
        withdrawalAmount = _withdrawalAmount;
    }

    function requestTokens() public {
        require(block.timestamp >= nextAccessTime[msg.sender], "You have already requested tokens recently.");
        token.transfer(msg.sender, withdrawalAmount);
        nextAccessTime[msg.sender] = block.timestamp + 1 days;
    }

    function setWithdrawalAmount(uint256 newAmount) public {
        require(msg.sender == owner, "Only the owner can set the withdrawal amount.");
        withdrawalAmount = newAmount;
    }

    function transferOwnership(address newOwner) public {
        require(msg.sender == owner, "Only the owner can transfer ownership.");
        owner = newOwner;
    }

    function withdrawTokens() public {
        require(msg.sender == owner, "Only the owner can withdraw the remaining tokens.");
        token.transfer(owner, token.balanceOf(address(this)));
    }

    function withdrawEther() public {
        require(msg.sender == owner, "Only the owner can withdraw ether.");
        payable(owner).transfer(address(this).balance);
    }

    receive() external payable {
        // Allow the contract to receive Ether to fund the faucet
    }
}
