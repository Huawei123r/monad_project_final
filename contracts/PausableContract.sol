// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PausableContract is Pausable, Ownable {
    uint256 public value;

    constructor() Ownable() {}

    function setValue(uint256 _newValue) public whenNotPaused onlyOwner {
        value = _newValue;
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function pause() public onlyOwner whenNotPaused {
        _pause();
    }

    function unpause() public onlyOwner whenPaused {
        _unpause();
    }
}