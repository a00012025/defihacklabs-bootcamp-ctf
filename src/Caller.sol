// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface ITarget {
    function mintFlag() external;
}

contract Caller {
    constructor() {
        ITarget target = ITarget(0x69279B621e2C10B90724CDa374CD43A23A9DA90f);
        target.mintFlag();
    }
}
