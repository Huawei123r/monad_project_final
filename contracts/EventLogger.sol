// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract EventLogger is Ownable {
    event LogMessage(address indexed sender, string message, uint256 timestamp);
    event LogValue(address indexed sender, uint256 value, uint256 timestamp);

    constructor() Ownable() {}

    function logMessage(string memory _message) public {
        emit LogMessage(msg.sender, _message, block.timestamp);
    }

    function logValue(uint256 _value) public {
        emit LogValue(msg.sender, _value, block.timestamp);
    }
}
