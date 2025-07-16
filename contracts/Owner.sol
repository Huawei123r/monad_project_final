// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Owner is Ownable {
    string public message;

    constructor() Ownable() {}

    function setMessage(string memory newMessage) public onlyOwner {
        message = newMessage;
    }
}
