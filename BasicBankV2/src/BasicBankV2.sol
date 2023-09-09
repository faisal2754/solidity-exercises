// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract BasicBankV2 {
    /// used to store the balance of users
    ///     USER    =>  BALANCE
    mapping(address => uint256) public balances;

    /// @notice deposit ether into the contract
    /// @dev it should work properly when called multiple times
    function addEther() external payable {
        console.log("Adding %s ether", msg.value / 1 ether);
        balances[msg.sender] += msg.value;
    }

    /// @notice used to withdraw ether from the contract
    /// @param amount of ether to remove. Cannot execeed balance i.e users cannot withdraw more than they deposited
    function removeEther(uint256 amount) external payable {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        console.log("Withdrawing %s ether", amount / 1 ether);
        payable(msg.sender).transfer(amount);
    }
}
