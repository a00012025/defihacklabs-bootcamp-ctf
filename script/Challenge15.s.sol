// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Challenge15Solver} from "../src/Challenge15.sol";

contract Challenge15Script is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        // Deploy the solver contract
        new Challenge15Solver();
        console.log("Deployed Challenge15Solver");

        vm.stopBroadcast();
    }
}
