// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint256 public count;

    function setCount(uint256 _count) public {
        count = _count;
    }

    function increment() public {
        count += 1;
    }

    function decrement() public {
        // Underflow is protected by default in Solidity ^0.8.0
        count -= 1;
    }

    function getCount() public view returns (uint256) {
        return count;
    }
}
