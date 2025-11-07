// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract MergeSortedArray {
    function mergeSortedArray(
        int[] calldata arr1,
        int[] calldata arr2
    ) public pure returns (int[] memory sortedArray) {
        uint i = arr1.length;
        uint j = arr2.length;
        uint k = i + j;
        int[] memory merged = new int[](k);
        while (i > 0 && j > 0) {
            if (arr1[i - 1] >= arr2[j - 1]) {
                merged[k - 1] = arr1[i - 1];
                i--;
            } else {
                merged[k - 1] = arr2[j - 1];
                j--;
            }
            k--;
        }
        while (i > 0) {
            merged[k - 1] = arr1[i - 1];
            i--;
            k--;
        }
        while (j > 0) {
            merged[k - 1] = arr2[j - 1];
            j--;
            k--;
        }
        return merged;
    }
}
