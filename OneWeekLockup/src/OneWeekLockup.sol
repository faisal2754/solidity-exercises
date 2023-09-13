// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

error InsufficientFunds();
error TooSoon();

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */

    mapping(address => uint256) public userDeposit;
    mapping(address => uint256) public recentDepositTime;

    function balanceOf(address user) public view returns (uint256) {
        return userDeposit[user];
    }

    function depositEther() external payable {
        userDeposit[msg.sender] += msg.value;
        recentDepositTime[msg.sender] = block.timestamp;
    }

    function withdrawEther(uint256 amount) external {
        if (amount > userDeposit[msg.sender]) {
            revert InsufficientFunds();
        }

        if (recentDepositTime[msg.sender] + 1 weeks > block.timestamp) {
            revert TooSoon();
        }

        payable(msg.sender).transfer(amount);
        userDeposit[msg.sender] -= amount;
    }
}
