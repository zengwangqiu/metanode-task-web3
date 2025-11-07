// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract BinarySearch {
    function binarySearch(
        int[] calldata arr,
        int target
    ) public pure returns (int res) {
        uint l = 0;
        uint r = arr.length-1;
        while (l <= r) {
            uint m = (l + r) / 2;
            if (arr[m] < target) {
                l = m + 1;
            } else if (arr[m] > target) {
                r = m - 1;
            } else {
                return int(m);
            }
        }
        return -1;
    }
}
