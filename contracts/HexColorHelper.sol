// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

//import "hardhat/console.sol";


abstract contract HexColorHelper {

    // got idea from openzeppelin/contracts/utils/Strings.sol;
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

    struct HexColor {
        string rgbColor;
        bool isDark;
    }

    // inspired by toHexString in openzeppelin/contracts/utils/Strings.sol;
    function randHexColor(uint256 tokenId, string memory seed) internal view returns (HexColor memory) {
        bytes32 randHash = keccak256(abi.encodePacked(block.timestamp, tokenId, seed));
        // total 6 hexadecimal digits in one 24 bit RGB value, plus 1 extra for the # char
        bytes memory hexColor = new bytes(7);
        bool isDark = false;
        uint8 val;
        uint16 sum = 0;
        hexColor[0] = "#";
        for (uint256 i = 0; i < 6; i++) {
            val = uint8(randHash[i]) & 0xf;
            if (i % 2 == 0) {
                sum += val;
            }
            // since index 0 is the #, use i+1 index for hexColor, i for randHash
            hexColor[i + 1] = _HEX_SYMBOLS[uint8(randHash[i]) & 0xf];
        }
        // if average of leading hex digit is less than 9, consider it a dark color
        // used for deciding whether to use white or black text
        if ((sum / 3) < 8) isDark = true;

        return HexColor(string(hexColor), isDark);
    } 

}