// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Lottery is Ownable {
    address[] public players;
    uint256 public lotteryId;
    address public recentWinner;
    uint256 public ticketPrice;

    event LotteryEnded(address winner, uint256 amount);

    constructor(uint256 _ticketPrice) Ownable() {
        ticketPrice = _ticketPrice;
        lotteryId = 0;
    }

    function enter() public payable {
        require(msg.value >= ticketPrice, "Not enough Ether to enter");
        players.push(msg.sender);
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    function pickWinner() public onlyOwner {
        require(players.length > 0, "No players in the lottery");
        uint256 index = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, players))) % players.length;
        address winner = players[index];
        (bool success, ) = payable(winner).call{value: address(this).balance}("");
        require(success, "Transfer failed.");

        emit LotteryEnded(winner, address(this).balance);

        // Reset the lottery
        players = new address[](0);
        lotteryId++;
        recentWinner = winner;
    }
}
