// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

interface IChallenge8 {
    function mintFlag(bytes32 _password) external;
}

contract Challenge8Script is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        
        // Calculate the new password
        uint256 count = 0;
        bytes32 password = 0x3dc09d7c41beb2799203bfb8cfd8d48dff230c3040f86166c3f108e4235fe4e8;
        
        // Calculate mask: ~(bytes32(uint256(0xFF) << ((31 - (count % 32)) * 8)))
        bytes32 mask = ~(bytes32(uint256(0xFF) << ((31 - (count % 32)) * 8)));
        
        // Calculate new password
        bytes32 newPassword = password & mask;
        
        console.logBytes32(mask);
        console.logBytes32(newPassword);

        vm.startBroadcast(privateKey);

        // Call mintFlag with the calculated password
        IChallenge8(0xB2c756B0cE8A77f4d7E4A263552fb7aF892d4dDF).mintFlag(newPassword);

        vm.stopBroadcast();
    }
}
