// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract BeggingContract is Ownable {
    mapping(address => uint) public donations;
    event Donation(address, uint);
    address public top1;
    address public top2;
    address public top3;
    uint public startTime;
    uint public endTime;

    constructor(uint startMinutes, uint endMinutes) Ownable(msg.sender) {
        startTime = block.timestamp + startMinutes * 1 minutes;
        endTime = startTime + endMinutes * 1 minutes;
    }

    function donate() public payable returns (bool) {
        require(block.timestamp > startTime, "Donations have not started yet");
        require(block.timestamp < endTime, "Donations are closed");
        donations[msg.sender] += msg.value;
        uint count = donations[msg.sender];
        if (count > donations[top1]) {
            top3 = top2;
            top2 = top1;
            top1 = msg.sender;
        } else if (count > donations[top2]) {
            top3 = top2;
            top2 = msg.sender;
        } else if (count > donations[top3]) {
            top3 = msg.sender;
        }
        emit Donation(msg.sender, msg.value);
        return true;
    }

    function getDonation(address _addr) external view returns (uint) {
        return donations[_addr];
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
