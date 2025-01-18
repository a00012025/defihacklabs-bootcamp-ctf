// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {console} from "forge-std/console.sol";

interface IChallenge4 {
    function mintFlag(address _minter, bytes memory signature) external;
}

contract Challenge4Script is Script {
    using ECDSA for bytes32;
    using MessageHashUtils for bytes32;

    function setUp() public {}

    function run() public {
        string
            memory hardhatMnemonic = "test test test test test test test test test test test junk";
        uint256 challenge4AccountPrivateKey = vm.deriveKey(hardhatMnemonic, 12);

        // Get the minter address from the private key
        address minter = vm.addr(challenge4AccountPrivateKey);

        // Create the message hash
        address sender = 0x0000007EabfC2E6a6b33b21D2f73D58941BAb574;
        bytes32 message = keccak256(abi.encode("BG CTF Challenge 4", sender));
        bytes32 hash = keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", message)
        );

        // Sign the message
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(
            challenge4AccountPrivateKey,
            hash
        );
        bytes memory signature = abi.encodePacked(r, s, v);

        uint256 senderPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(senderPrivateKey);

        // Call mintFlag directly
        IChallenge4(0xaa08f4d762f9D70Ba50B44a47B269a65AB18bE17).mintFlag(
            minter,
            signature
        );

        vm.stopBroadcast();
    }
}
