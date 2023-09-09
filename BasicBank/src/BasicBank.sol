// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract BasicBank {
    /// @notice deposit ether into the contract
    /// @dev it should work properly when called multiple times
    function addEther() external payable {
        console.log("Received %s ether", msg.value / 1 ether);
    }

    /// @notice used to withdraw ether from the contract (No restriction on withdrawals)
    function removeEther(uint256 amount) external payable {
        console.log("Withdrawing %s ether", amount / 1 ether);
        payable(msg.sender).transfer(amount);
    }
}
