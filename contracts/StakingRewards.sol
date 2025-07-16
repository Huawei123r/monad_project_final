// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract StakingRewards is Ownable {
    IERC20 public stakingToken;
    IERC20 public rewardsToken;

    uint256 public rewardRate;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;

    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;
    mapping(address => uint256) public stakedAmount;

    event Staked(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event RewardPaid(address indexed user, uint256 reward);
    event RewardsDistributed(uint256 amount);

    constructor(address _stakingToken, address _rewardsToken) Ownable() {
        stakingToken = IERC20(_stakingToken);
        rewardsToken = IERC20(_rewardsToken);
    }

    function _updateReward() internal {
        rewardPerTokenStored = rewardPerToken();
        lastUpdateTime = block.timestamp;
    }

    function rewardPerToken() public view returns (uint256) {
        if (stakingToken.totalSupply() == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored +
            (rewardRate * (block.timestamp - lastUpdateTime) * 1e18) /
            stakingToken.totalSupply();
    }

    function earned(address account) public view returns (uint256) {
        return
            ((stakedAmount[account] * (rewardPerToken() - userRewardPerTokenPaid[account])) / 1e18) +
            rewards[account];
    }

    function stake(uint256 amount) public {
        require(amount > 0, "Cannot stake 0");
        _updateReward();
        rewards[msg.sender] = earned(msg.sender);
        userRewardPerTokenPaid[msg.sender] = rewardPerTokenStored;
        stakedAmount[msg.sender] += amount;
        stakingToken.transferFrom(msg.sender, address(this), amount);
        emit Staked(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Cannot withdraw 0");
        _updateReward();
        rewards[msg.sender] = earned(msg.sender);
        userRewardPerTokenPaid[msg.sender] = rewardPerTokenStored;
        stakedAmount[msg.sender] -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }

    function getReward() public {
        _updateReward();
        uint256 reward = earned(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            rewardsToken.transfer(msg.sender, reward);
            emit RewardPaid(msg.sender, reward);
        }
    }

    function setRewardRate(uint256 _rewardRate) public onlyOwner {
        _updateReward();
        rewardRate = _rewardRate;
    }

    function distributeRewards(uint256 amount) public onlyOwner {
        rewardsToken.transferFrom(msg.sender, address(this), amount);
        emit RewardsDistributed(amount);
    }
}
