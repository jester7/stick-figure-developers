// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

abstract contract StickFigureDeveloperSvg {

    string constant baseSvg =
        "<svg xmlns='http://www.w3.org/2000/svg' viewBox='-8 -8 460 760'> <defs> <style> * { stroke: #000; stroke-miterlimit: 10; stroke-width: 2px; } .lettering { stroke-width:0; } .body { fill: none; } .face,.body line { stroke-width:3px; } .face, .nose, .whites { fill: #fff; } .mouth { fill: #fff; stroke-width:3px; } .devtype { font: bold 34px monospace; } .langtype { font: bold 34px sans-serif; } .pupils{fill:#000;}.light{fill:#fff;}.dark{fill:#000;}</style> </defs> <g class='body'> <line x1='225' y1='325' x2='450' y2='400' /> <line x1='225' y1='325' x2='0' y2='400' /> <line x1='225' y1='300' x2='225' y2='550' /> <line x1='225' y1='550' x2='150' y2='750' /> <line x1='225' y1='550' x2='300' y2='750' /></g><g class='clothes'>";

    string constant closeTagSvg = "' />";
    string constant shirtSvg = " <path class='shirt' d='M500,400V550H300V400l-75,50V375l75-50h25s25,25,75,25,75-25,75-25h25l75,50v75Z' transform='translate(-175 -25)' fill='";
    string constant clothesPantsSvg = "<polyline class='bottom pants' points='325 725 325 525 125 525 125 525 125 725 200 725 225 600 250 725 325 725' fill='";
    string constant clothesSkirtSvg = "<polyline class='bottom skirt' points='325 675 325 525 125 525 125 525 125 675 200 675 225 675 250 675 325 675'  fill='";
    string constant clothesShortsSvg = "<polyline class='bottom shorts' points='325 675 325 525 125 525 125 525 125 675 200 675 225 600 250 675 325 675' fill='";
    string constant headBaseSvg = "<g class='head'> <circle class='face' cx='225' cy='150' r='150' /><polyline class='nose' points='225 125 250 150 225 150'/><g class='eyes'> <ellipse class='whites' cx='160' cy='100' rx='30' ry='20' /> <ellipse class='whites' cx='290' cy='100' rx='30' ry='20' />";
    
    string[] internal irisSvg = ["<g fill='#523a28'><circle class='iris' cx='160' cy='100' r='16' /><circle class='iris' cx='290' cy='100' r='16' /></g>",
                                "<g fill='#8b4513'><circle class='iris' cx='160' cy='100' r='16' /><circle class='iris' cx='290' cy='100' r='16' /></g>",
                                "<g fill='#756d0e'><circle class='iris' cx='160' cy='100' r='16' /><circle class='iris' cx='290' cy='100' r='16' /></g>",
                                "<g fill='#0b751a'><circle class='iris' cx='160' cy='100' r='16' /><circle class='iris' cx='290' cy='100' r='16' /></g>",
                                "<g fill='#969696'><circle class='iris' cx='160' cy='100' r='16' /><circle class='iris' cx='290' cy='100' r='16' /></g>",
                                "<g fill='#0872e3'><circle class='iris' cx='160' cy='100' r='16' /><circle class='iris' cx='290' cy='100' r='16' /></g>"];

    string constant pupilsNormalSvg = "<circle class='pupils' cx='160' cy='100' r='6'/><circle class='pupils' cx='290' cy='100' r='6'/></g>";
    string constant pupilsHighAfSvg = "<circle class='pupils' cx='160' cy='100' r='12'/><circle class='pupils' cx='290' cy='100' r='12'/></g>";
        
    string constant smilingMouthSvg = "<path class='mouth' d='M400,274c-39.57,0-63.54-32.2-71.31-44.63C338,236.38,361.91,251,400,251c26,0,45.2-6.85,56.7-12.61a92.22,92.22,0,0,0,14.56-8.94C463.43,242,439.48,274,400,274Z' transform='translate(-174.68 -25)'/><path d='M467.56,233.3a112.39,112.39,0,0,1-12.81,15.37C443.62,259.77,425.1,273,400,273s-43.62-13.23-54.75-24.33a112.39,112.39,0,0,1-12.81-15.37,99.34,99.34,0,0,0,10.42,6c21,10.5,42.67,12.71,57.14,12.71,26.22,0,45.55-6.91,57.14-12.71a99.34,99.34,0,0,0,10.42-6M475,225s-25,25-75,25-75-25-75-25,25,50,75,50,75-50,75-50Z' transform='translate(-175 -25)'/>";
    string constant sadMouthSvg = "<path class='mouth' d='M400,227c25.1,0,43.62,13.23,54.75,24.33a112.39,112.39,0,0,1,12.81,15.37,99.34,99.34,0,0,0-10.42-6C436.13,250.21,414.47,248,400,248c-26.22,0-45.55,6.91-57.14,12.71a99.34,99.34,0,0,0-10.42,6,112.39,112.39,0,0,1,12.81-15.37C356.38,240.23,374.9,227,400,227m0-2c-50,0-75,50-75,50s25-25,75-25,75,25,75,25-25-50-75-50Z' transform='translate(-175 -25)'/>";
    string constant neutralMouthSvg = "<line class='mouth' x1='150' y1='225' x2='300' y2='225'/>";
    string constant omgMouthSvg = "<ellipse class='mouth' cx='225' cy='225' rx='50' ry='50' />";

    string constant lightTextSvg = "<g class='light'>";
    string constant darkTextSvg = "<g class='dark'>";
    string constant devTypeSvg = "<text class='lettering devtype' x='49%' y='47%' dominant-baseline='middle' text-anchor='middle'></text>";
    string constant devType10xSvg = "<text class='lettering devtype' x='49%' y='47%' dominant-baseline='middle' text-anchor='middle'>10x</text>";
    string constant langBaseSvg = "<text class='lettering langtype' x='49%' y='52%' dominant-baseline='middle' text-anchor='middle'>";
    string constant devTextSvg = "<text class='lettering langtype' x='49%' y='57%' dominant-baseline='middle' text-anchor='middle'>Developer</text></g>";
    string constant textClosingSvg = "</text>";

}
