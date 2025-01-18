// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Challenge6Caller} from "../src/Challenge6.sol";

contract Challenge6Script is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        // Deploy the contract
        Challenge6Caller caller = new Challenge6Caller();

        // Call run to start the process
        caller.run{gas: 230000}();

        vm.stopBroadcast();
    }
}
