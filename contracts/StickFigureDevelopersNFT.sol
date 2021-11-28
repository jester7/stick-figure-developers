// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "./StickFigureDeveloper.sol";
import "./HexColorHelper.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

//import "hardhat/console.sol";

import { Base64 } from "./libraries/Base64.sol";

contract StickFigureDevelopersNFT is StickFigureDeveloper {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    uint256 public constant MAX_SUPPLY = 1000;

    function getDeveloperCount() public view returns (uint256) {
        return _tokenIds.current();
    }

    function getMaxSupply() public pure returns (uint256) {
        return MAX_SUPPLY;
    }

    event NewDeveloper(address sender, uint256 tokenId);
 
    function createDeveloper() public {
        require(_tokenIds.current() < MAX_SUPPLY, "all NFTs have been minted");
        uint256 newItemId = _tokenIds.current();
        generateRandomDeveloper(newItemId);

        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, string(abi.encodePacked("data:application/json;base64,", Base64.encode(
                abi.encodePacked(
                    '{"name": "A stick figure developer","description": "A whimsical collection of developers.", "image": "data:image/svg+xml;base64,',
                    Base64.encode(buildFinalSvg(newItemId)),
                    '"}'
                )))));
        _tokenIds.increment();

        //console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
        emit NewDeveloper(msg.sender, newItemId);
    }
}
