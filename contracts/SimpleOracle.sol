// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleOracle is Ownable {
    uint256 public latestPrice;
    uint256 public lastUpdatedTimestamp;

    event PriceUpdated(uint256 newPrice, uint256 timestamp);

    constructor() Ownable() {}

    function updatePrice(uint256 _newPrice) public onlyOwner {
        latestPrice = _newPrice;
        lastUpdatedTimestamp = block.timestamp;
        emit PriceUpdated(_newPrice, block.timestamp);
    }

    function getLatestPrice() public view returns (uint256) {
        return latestPrice;
    }

    function getLastUpdatedTimestamp() public view returns (uint256) {
        return lastUpdatedTimestamp;
    }
}
