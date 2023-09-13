// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */

    uint256 highestDeposit;
    address payable winner;
    uint256 endTime;

    constructor() {
        endTime = block.timestamp;
    }

    function bet() public payable {
        if (msg.value > highestDeposit) {
            highestDeposit = msg.value;
            winner = payable(msg.sender);
            endTime = block.timestamp + 1 hours;
        }
    }

    function claimPrize() public {
        if (msg.sender != winner) {
            revert("not the winner");
        }

        if (endTime > block.timestamp) {
            revert("betting time not over yet");
        }

        winner.transfer(address(this).balance);
    }
}
