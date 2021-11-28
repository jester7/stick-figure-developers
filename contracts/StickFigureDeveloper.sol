// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./HexColorHelper.sol";
import "./RandomHelper.sol";
import "./StickFigureDeveloperSvg.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import "hardhat/console.sol";


contract StickFigureDeveloper is
ERC721URIStorage, StickFigureDeveloperSvg, RandomHelper, HexColorHelper {

    enum Pupils {
        Normal,
        HighAF
    }

    enum Iris {
        DarkBrown,
        Brown,
        Hazel,
        Green,
        Gray,
        Blue
    }

    
    enum Mouths {
        Smiling,
        Sad,
        Neutral,
        OMG
    }

// was getting a lot of 1's so added a Pants2 to favor pants over others
    enum Clothes {
        Pants,
        Pants2, 
        Skirt,
        Shorts
    }

    struct Developer {
        Iris eyeColor;
        Pupils pupilSize;
        Mouths expression;
        Clothes clothesType;
        HexColor shirtColor;
        HexColor bottomColor;
        bool is10x;
        string language;
    }

    string[] public languages = ["Ada", "BASIC", "C", "C#", "C++", "Clojure",
    "Cobol", "Dart", "Erlang", "Go", "Haskell", "Java", "JavaScript", "Julia",
    "Kotlin", "Lua", "OCaml", "Objective-C", "PHP", "Pascal", "Perl", "Python",
    "R", "Ruby", "Rust", "Scala", "Solidity", "Swift", "TypeScript"];


    Developer[] public developers;

    // mapping (uint => address) public devToOwner;
    // mapping (address => uint) ownerDevCount;


    constructor() ERC721("Stick Figure Developers test", "STICKFIG") {
        //console.log("This is my Stick Figure Developers NFT contract, wagmi!");        
    }

    function generateRandomDeveloper(uint256 id) internal {
        //uint256 id = developers.length;

        //uint langNum = 

        developers.push(Developer(
            Iris(getRandomInt(0, 5, "iris")),
            Pupils(getRandomInt(0, 9, "pupil") < 9 ? 0 : 1),
            Mouths(getRandomInt(0, 3, "mouths")),
            Clothes(getRandomInt(0, 3, "clothes")),
            randHexColor(id, "shirt"),
            randHexColor(id, "clothes"),
            (getRandomInt(0, 99, "10x") > 79),
            languages[getRandomInt(0, languages.length - 1, "lang")]
        ));

        console.log("end of generateRandomDeveloper...");
        
    }

   
    function getShirtTextSvg(uint256 id) internal view returns (bytes memory) {
        //bool isDark = developers[id].shirtColor.isDark;
        // if i enable this check get large code error
        // having trouble with stack size issues too
        // if (developers[id].shirtColor.isDark) {
        //     return abi.encodePacked(developers[id].is10x ? devTypeWhite10xSvg : devTypeWhiteSvg,
        //     langBaseWhiteSvg, developers[id].language ,textClosingSvg,
        //     devTextWhiteSvg);
        // }

        //fixed large contract size errors by moving dark/light text to fill of g tag
        // and inlining the isDark check below with ?:
            return abi.encodePacked(developers[id].shirtColor.isDark ? lightTextSvg : darkTextSvg,
                developers[id].is10x ? devType10xSvg : devTypeSvg,
            langBaseSvg, developers[id].language ,textClosingSvg,
            devTextSvg);
        
        
    }


    function buildFinalSvg(uint256 id) internal view returns (bytes memory) {
        //string memory shirtText = string(getShirtTextSvg(id));
        
        return 
            abi.encodePacked(baseSvg, getShirtSvg(id), getBottomClothesSvg(id),headBaseSvg,
            getEyesSvg(id),"</g> ", getMouthSvg(id),getShirtTextSvg(id),
            "</svg>");
    }

    function getEyesSvg(uint256 id) internal view returns (string memory) { 

        return
            string(
                abi.encodePacked(irisSvg[uint256(developers[id].eyeColor)],(developers[id].pupilSize == Pupils.HighAF ? pupilsHighAfSvg : pupilsNormalSvg)));
    }

    function getMouthSvg(uint256 id) internal view returns (string memory) {
        Mouths expression = developers[id].expression;
        string memory mouthSvg;
        if (expression == Mouths.Smiling) {
            mouthSvg = smilingMouthSvg;
        } else if (expression == Mouths.Sad) {
            mouthSvg = sadMouthSvg;
        } else if (expression == Mouths.Neutral)  {
            mouthSvg = neutralMouthSvg;
        } else {
            mouthSvg = omgMouthSvg;
        }
        return mouthSvg;
    }

    function getShirtSvg(uint256 id) internal view returns (string memory) {
        HexColor memory shirtColor = randHexColor(id, "shirt");
        string memory textColor = "#000";
        if (shirtColor.isDark) {
            textColor = "#fff";
        }  // need to set text color elsewhere, here just use the random color of shirt
        return string(abi.encodePacked(shirtSvg, shirtColor.rgbColor, closeTagSvg));
    }


    function getBottomClothesSvg(uint256 id) internal view returns (string memory) {
        Clothes clothes = developers[id].clothesType;
        string memory clothesSvg;
        if (clothes == Clothes.Pants || clothes == Clothes.Pants2) {
            clothesSvg = clothesPantsSvg;
        } else if (clothes == Clothes.Skirt) {
            clothesSvg = clothesSkirtSvg;
        } else {
            clothesSvg = clothesShortsSvg;
        }

        return string(abi.encodePacked(clothesSvg, randHexColor(id, "clothes").rgbColor, closeTagSvg, "</g>"));
    }


}