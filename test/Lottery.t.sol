// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../contracts/Lottery.sol";

contract LotteryTest is Test {
    Lottery public lottery;
    uint256 public ticketPrice = 0.1 ether;

    function setUp() public {
        lottery = new Lottery(ticketPrice);
    }

    function testEnter() public {
        vm.deal(address(this), 1 ether);
        lottery.enter{value: ticketPrice}();
        address[] memory players = lottery.getPlayers();
        assertEq(players.length, 1);
        assertEq(players[0], address(this));
    }

    function testPickWinner() public {
        address player1 = address(0x1);
        address player2 = address(0x2);
        vm.deal(player1, 1 ether);
        vm.deal(player2, 1 ether);

        vm.prank(player1);
        lottery.enter{value: ticketPrice}();

        vm.prank(player2);
        lottery.enter{value: ticketPrice}();

        lottery.pickWinner();
        address winner = lottery.recentWinner();
        assertTrue(winner == player1 || winner == player2);
    }
}
