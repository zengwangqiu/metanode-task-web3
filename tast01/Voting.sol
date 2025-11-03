// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract Volting {
    using EnumerableSet for EnumerableSet.StringSet;
    EnumerableSet.StringSet private _candidates;
    mapping(string => uint256) private _votes;
    mapping(address => bool) private _hasVoted;
    address public owner;
    event VoteCast(address indexed voter, string candidate, uint256 votes);
    event VotesReset(address indexed by, uint256 totalVotes);

    modifier onlyOwner() {
        require(msg.sender == owner, "Voting: caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function vote(string memory candidate) external {
        require(!_hasVoted[msg.sender], "Voting: caller has already voted");
        _hasVoted[msg.sender] = true;
        _candidates.add(candidate);
        _votes[candidate] += 1;
        emit VoteCast(msg.sender, candidate, _votes[candidate]);
    }

    function getVotes(string memory candidate) external view returns (uint256) {
        return _votes[candidate];
    }

    function resetVotes() external onlyOwner {
        
    }
}
