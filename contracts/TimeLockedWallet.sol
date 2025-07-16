// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TimeLockedWallet is Ownable {
    mapping(address => uint256) public lockedAmounts;
    mapping(address => uint256) public unlockTimes;

    event FundsDeposited(address indexed depositor, uint256 amount, uint256 unlockTime);
    event FundsWithdrawn(address indexed beneficiary, uint256 amount);

    constructor() Ownable() {}

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero.");
        lockedAmounts[msg.sender] += msg.value;
        unlockTimes[msg.sender] = block.timestamp + 7 days; // Lock for 7 days by default
        emit FundsDeposited(msg.sender, msg.value, unlockTimes[msg.sender]);
    }

    function depositERC20(address _token, uint256 _amount) public {
        require(_amount > 0, "Deposit amount must be greater than zero.");
        IERC20 token = IERC20(_token);
        require(token.transferFrom(msg.sender, address(this), _amount), "Token transfer failed.");
        lockedAmounts[msg.sender] += _amount;
        unlockTimes[msg.sender] = block.timestamp + 7 days; // Lock for 7 days by default
        emit FundsDeposited(msg.sender, _amount, unlockTimes[msg.sender]);
    }

    function withdraw() public {
        require(lockedAmounts[msg.sender] > 0, "No funds to withdraw.");
        require(block.timestamp >= unlockTimes[msg.sender], "Funds are still locked.");

        uint256 amount = lockedAmounts[msg.sender];
        lockedAmounts[msg.sender] = 0;
        unlockTimes[msg.sender] = 0;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "ETH transfer failed.");
        emit FundsWithdrawn(msg.sender, amount);
    }

    function withdrawERC20(address _token) public {
        require(lockedAmounts[msg.sender] > 0, "No funds to withdraw.");
        require(block.timestamp >= unlockTimes[msg.sender], "Funds are still locked.");

        uint256 amount = lockedAmounts[msg.sender];
        lockedAmounts[msg.sender] = 0;
        unlockTimes[msg.sender] = 0;

        IERC20 token = IERC20(_token);
        require(token.transfer(msg.sender, amount), "Token transfer failed.");
        emit FundsWithdrawn(msg.sender, amount);
    }

    function setUnlockTime(address _user, uint256 _newUnlockTime) public onlyOwner {
        require(_newUnlockTime > block.timestamp, "Unlock time must be in the future.");
        unlockTimes[_user] = _newUnlockTime;
    }
}