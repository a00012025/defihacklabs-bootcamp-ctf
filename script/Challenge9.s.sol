// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

interface IERC721 {
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) external;
}

contract Challenge9Script is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        IERC721 target = IERC721(0xDAa4Cac4F90693E73d1063204CaA4Ff5Ae94f330);

        target.safeTransferFrom(
            0x0000007EabfC2E6a6b33b21D2f73D58941BAb574,
            0xDAa4Cac4F90693E73d1063204CaA4Ff5Ae94f330,
            2,
            hex"0000000000000000000000000000000000000000000000000000000000000029"
        );

        vm.stopBroadcast();
    }
}
