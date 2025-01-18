// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Challenge10Caller} from "../src/Challenge10.sol";

contract Create2Deployer {
    function deploy(bytes memory code, bytes32 salt) public returns (address addr) {
        assembly {
            addr := create2(0, add(code, 0x20), mload(code), salt)
            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }
    }
}

contract Challenge10Script is Script {
    function setUp() public {}

    function calculateAddress(
        address deployer,
        bytes32 salt,
        bytes memory bytecode
    ) public pure returns (address) {
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                deployer,
                salt,
                keccak256(bytecode)
            )
        );
        return address(uint160(uint256(hash)));
    }

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address origin = 0x0000007EabfC2E6a6b33b21D2f73D58941BAb574;
        
        // Get the bytecode of our contract
        bytes memory bytecode = type(Challenge10Caller).creationCode;
        
        // Deploy the Create2Deployer first
        vm.startBroadcast(privateKey);
        Create2Deployer deployer = new Create2Deployer();
        vm.stopBroadcast();
        
        // Calculate a valid salt
        uint8 originLast = uint8(abi.encodePacked(origin)[19]);
        uint8 originMasked = originLast & 0x15;
        
        bytes32 salt;
        address predictedAddress;
        
        // Try different salts until we find one that gives us a valid address
        for (uint256 i = 0; i < type(uint256).max; i++) {
            salt = bytes32(i);
            predictedAddress = calculateAddress(address(deployer), salt, bytecode);
            
            uint8 senderLast = uint8(abi.encodePacked(predictedAddress)[19]);
            if ((senderLast & 0x15) == originMasked) {
                console.log("Found valid salt:", uint256(salt));
                console.log("Predicted address:", predictedAddress);
                break;
            }
        }
        
        // Deploy the contract with the found salt
        vm.startBroadcast(privateKey);
        deployer.deploy(bytecode, salt);
        vm.stopBroadcast();
    }
}
