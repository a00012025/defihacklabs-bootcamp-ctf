// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IChallenge4 {
    function mintFlag(address _minter, bytes memory signature) external;
}

contract Challenge4Caller {
    constructor(address _minter, bytes memory _signature) {
        IChallenge4 target = IChallenge4(0xaa08f4d762f9D70Ba50B44a47B269a65AB18bE17);
        target.mintFlag(_minter, _signature);
    }
}
