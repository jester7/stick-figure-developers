// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract RandomHelper {

    function getRandomInt(uint256 min, uint256 max, string memory seed)
    internal view returns (uint256) {
        return (uint256(keccak256(
                    abi.encodePacked(block.timestamp, seed)))
                    % (max + 1 - min)) + min;
    }

    function getRandomInt(string memory seed)
    public view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, seed)));
    }

}