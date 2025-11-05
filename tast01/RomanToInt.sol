// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract RomanToInt {
    mapping(bytes1 => uint256) private dic;
    constructor() {
        dic["I"] = 1;
        dic["V"] = 5;
        dic["X"] = 10;
        dic["L"] = 50;
        dic["C"] = 100;
        dic["D"] = 500;
        dic["M"] = 1000;
    }

    function romanToInt(string memory s) public view returns (uint256) {
        bytes memory sArr = bytes(s);
        uint256 result = 0;

        for (uint i = 0; i < sArr.length; i++) {
            // 如果当前字符的值小于下一个字符的值，则减去当前字符的值；否则，加上当前字符的值
            bytes1 pre = sArr[i];
            if (i < sArr.length - 1 && dic[pre] < dic[sArr[i + 1]]) {
                result -= dic[pre];
            } else {
                result += dic[pre];
            }
        }

        return result;
    }
}
