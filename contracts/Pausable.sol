// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PausableContract is Pausable, Ownable {
    constructor() Ownable() {}

    function normalFunction() public view whenNotPaused {
        // This function can be paused
    }

    function emergencyFunction() public view {
        // This function cannot be paused
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }
}
