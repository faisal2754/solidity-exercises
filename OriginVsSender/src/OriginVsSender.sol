// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract OriginVsSender {
    /**
     *
     * TIP: Only an EOA(externally owned account i.e an address with a private key and public key) can initiate a transaction
     * There's no way for smart contracts to perform transactions except a transaction is initiated by an EOA telling the
     * smart contract what to do.
     *
     * In this exercise the task is to require that the caller of
     * the function "setNumber(uint256)" is an EOA using tx.origin and msg.sender keywords
     *
     */

    uint256 public number;

    /// Not sure why failing, investigate test cases
    function setNumber(uint256 num) external {
        console.log("origin is %s", tx.origin);
        console.log("sender is %s", msg.sender);

        if (msg.sender != tx.origin) {
            revert();
        }

        number = num;
    }
}
