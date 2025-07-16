// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Voting is Ownable {
    struct Proposal {
        uint256 id;
        string name;
        uint256 voteCount;
        bool exists;
    }

    uint256 public nextProposalId;
    mapping(uint256 => Proposal) public proposals;
    mapping(address => bool) public hasVoted;

    event ProposalCreated(uint256 indexed id, string name);
    event Voted(address indexed voter, uint256 indexed proposalId);

    constructor() Ownable() {
        nextProposalId = 0;
    }

    function createProposal(string memory _name) public onlyOwner {
        proposals[nextProposalId] = Proposal(nextProposalId, _name, 0, true);
        emit ProposalCreated(nextProposalId, _name);
        nextProposalId++;
    }

    function vote(uint256 _proposalId) public {
        require(proposals[_proposalId].exists, "Proposal does not exist");
        require(!hasVoted[msg.sender], "Already voted");

        proposals[_proposalId].voteCount++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, _proposalId);
    }

    function getProposal(uint256 _proposalId) public view returns (uint256 id, string memory name, uint256 voteCount) {
        require(proposals[_proposalId].exists, "Proposal does not exist");
        Proposal storage p = proposals[_proposalId];
        return (p.id, p.name, p.voteCount);
    }
}