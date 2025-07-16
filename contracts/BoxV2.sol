// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Box.sol";

contract BoxV2 is Box {
    constructor(uint256 value) Box(value) {}

    function increment() public {
        _value = _value + 1;
    }
}
