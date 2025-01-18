// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IChallenge6 {
    function count() external view returns (uint256);

    function mintFlag(uint256 code) external;
}

contract Challenge6Caller {
    address constant TARGET = 0xB2C9d018952830fcB277cA0A73DDC5aD4eCACDDa;

    function name() external pure returns (string memory) {
        return "BG CTF Challenge 6 Solution";
    }

    function run() external {
        uint256 count = IChallenge6(TARGET).count();
        uint256 code = count << 8;
        IChallenge6(TARGET).mintFlag{gas: 200000}(code);
    }
}
