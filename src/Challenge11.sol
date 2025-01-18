// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IChallenge11 {
    function mintFlag() external;
}

contract Challenge11Caller {
    constructor() {
        IChallenge11(0x9B4dC2fbC392882206CC3207e68ace3bDcb3a7c6).mintFlag();
    }
}
