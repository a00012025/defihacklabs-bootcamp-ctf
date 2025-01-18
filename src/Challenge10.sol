// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IChallenge10 {
    function mintFlag() external;
}

contract Challenge10Caller {
    constructor() {
        IChallenge10(0x9B4dC2fbC392882206CC3207e68ace3bDcb3a7c6).mintFlag();
    }
}
