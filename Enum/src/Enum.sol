// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract ExampleEnum {
    /*
        This exercise assumes you understand how Enum works.
        1. The `isWeekend` function returns a bool when called.
    */

    enum DayOfWeek {
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday,
        Sunday
    }

    function isWeekend(uint256 index) public pure returns (bool) {
        bool result = DayOfWeek.Saturday == DayOfWeek(index) ||
            DayOfWeek.Sunday == DayOfWeek(index);

        return result;
    }
}
