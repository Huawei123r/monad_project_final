// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("MyCrowdsaleToken", "MCT") Ownable() {
        _mint(msg.sender, initialSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

contract Crowdsale is Ownable {
    ERC20 public token;
    uint256 public rate; // How many tokens per ETH
    uint256 public cap;
    uint256 public weiRaised;

    event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    constructor(uint256 _rate, address _token, uint256 _cap) Ownable() {
        require(_rate > 0, "Crowdsale: rate is 0");
        require(_token != address(0), "Crowdsale: token is the zero address");
        require(_cap > 0, "Crowdsale: cap is 0");

        rate = _rate;
        token = ERC20(_token);
        cap = _cap;
    }

    receive() external payable {
        buyTokens(msg.sender);
    }

    function buyTokens(address beneficiary) public payable {
        uint256 weiAmount = msg.value;
        require(weiAmount > 0, "Crowdsale: weiAmount is 0");
        require(weiRaised + weiAmount <= cap, "Crowdsale: cap exceeded");

        uint256 tokens = weiAmount * rate;
        weiRaised += weiAmount;

        token.transfer(beneficiary, tokens);
        emit TokensPurchased(msg.sender, beneficiary, weiAmount, tokens);
    }

    function withdrawFunds() public onlyOwner {
        (bool success, ) = payable(owner()).call{value: address(this).balance}("");
        require(success, "Withdrawal failed");
    }
}
