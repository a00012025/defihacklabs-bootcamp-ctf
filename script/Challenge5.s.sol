// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Challenge5Caller} from "../src/Challenge5.sol";

contract Challenge5Script is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        // Deploy the contract
        Challenge5Caller caller = new Challenge5Caller();

        // Call run to start the process
        caller.run();

        vm.stopBroadcast();
    }
}
