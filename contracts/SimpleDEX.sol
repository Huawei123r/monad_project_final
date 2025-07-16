// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SimpleDEX {
    IERC20 public token1;
    IERC20 public token2;

    constructor(address _token1, address _token2) {
        token1 = IERC20(_token1);
        token2 = IERC20(_token2);
    }

    function swap(IERC20 from, IERC20 to, uint256 amount) public {
        require((from == token1 && to == token2) || (from == token2 && to == token1), "Invalid tokens.");
        
        uint256 toAmount = getSwapAmount(from, to, amount);

        from.transferFrom(msg.sender, address(this), amount);
        to.transfer(msg.sender, toAmount);
    }

    function getSwapAmount(IERC20 from, IERC20 to, uint256 amount) public view returns (uint256) {
        return (amount * getReserve(to)) / getReserve(from);
    }

    function getReserve(IERC20 token) public view returns (uint256) {
        return token.balanceOf(address(this));
    }

    function addLiquidity(uint256 amount1, uint256 amount2) public {
        token1.transferFrom(msg.sender, address(this), amount1);
        token2.transferFrom(msg.sender, address(this), amount2);
    }
}
