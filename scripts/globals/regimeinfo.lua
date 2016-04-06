<<<<<<< HEAD
-------------------------------------------------
--
-- Regime Info Database
--
-- Stores details on the number of monsters to kill
-- as well as the suggested level range.
-- n1,n2,n3,n4 = Number of monsters needed
-- sl = Start Level range
-- el = Level range
--
-- Example:
-- n1=6, n2=0, n3=0, n4=0, sl=1, el=6, Regime ID=1, produces:
-- Defeat the following monsters:
--  6 Worms
--  Level range 1 ~ 6
--  Area: West Ronfaure
-------------------------------------------------

function getRegimeInfo(regimeid)
    local regimeinfo = {
        [1] = {6,0,0,0,1,6},
        [2] = {6,0,0,0,2,6},
        [3] = {5,1,0,0,4,7},
        [4] = {4,2,0,0,4,8},
        [5] = {3,3,0,0,8,12},
        [6] = {8,0,0,0,12,13},
        [7] = {7,1,0,0,15,19},
        [8] = {6,2,0,0,15,22},
        [9] = {5,3,0,0,18,23},
        [10] = {4,4,0,0,20,23},
        [11] = {9,0,0,0,21,22},
        [12] = {8,1,0,0,21,23},
        [13] = {7,2,0,0,22,25},
        [14] = {6,3,0,0,24,25},
        [15] = {4,3,0,0,25,28},
        [16] = {6,0,0,0,1,6},
        [17] = {6,0,0,0,3,6},
        [18] = {5,1,0,0,3,7},
        [19] = {4,2,0,0,3,8},
        [20] = {3,3,0,0,10,12},
        [21] = {9,0,0,0,20,21},
        [22] = {8,1,0,0,20,22},
        [23] = {7,2,0,0,21,23},
        [24] = {6,3,0,0,22,25},
        [25] = {4,3,0,0,25,28},
        [26] = {6,0,0,0,1,5},
        [27] = {6,0,0,0,2,5},
        [28] = {5,1,0,0,3,8},
        [29] = {4,2,0,0,4,8},
        [30] = {3,3,0,0,7,12},
        [31] = {8,0,0,0,11,13},
        [32] = {7,1,0,0,15,19},
        [33] = {6,2,0,0,15,23},
        [34] = {5,3,0,0,20,24},
        [35] = {4,4,0,0,21,24},
        [36] = {9,0,0,0,20,21},
        [37] = {8,1,0,0,20,22},
        [38] = {7,2,0,0,21,23},
        [39] = {6,3,0,0,22,25},
        [40] = {4,3,0,0,25,28},
        -- Regime between 41-50
        [41] = {9,1,0,0,26,29},
        [42] = {8,2,0,0,26,29},
        [43] = {7,3,0,0,28,29},
        [44] = {6,4,0,0,28,30},
        [45] = {5,4,1,0,28,34},
        [46] = {9,2,0,0,34,38},
        [47] = {8,3,0,0,34,39},
        [48] = {7,4,0,0,37,42},
        [49] = {6,4,1,0,37,43},
        [50] = {5,4,2,0,40,43},
        [51] = {9,3,0,0,42,46},
        [52] = {8,4,0,0,42,45},
        [53] = {7,4,1,0,42,48},
        [54] = {6,4,2,0,42,48},
        [55] = {5,4,3,0,45,52},
        [56] = {6,1,0,0,4,8},
        [57] = {4,2,0,0,22,25},
        [58] = {8,2,0,0,15,18},
        [59] = {3,4,0,0,3,8},
        [60] = {5,4,1,0,22,25},
        [61] = {4,2,0,0,4,8},
        [62] = {4,3,0,0,22,27},
        [63] = {3,5,0,0,25,27},
        [64] = {6,0,0,0,1,5},
        [65] = {6,0,0,0,2,5},
        [66] = {7,0,0,0,2,6},
        [67] = {4,2,0,0,3,6},
        [68] = {4,2,0,0,4,8},
        [69] = {3,5,0,0,11,13},
        [70] = {5,3,0,0,11,14},
        [71] = {5,3,0,0,10,15},
        [72] = {5,2,0,0,23,26},
        [73] = {5,2,0,0,23,28},
        [74] = {5,2,2,0,26,32},
        [75] = {9,0,0,0,31,32},
        [76] = {6,0,0,0,1,6},
        [77] = {7,0,0,0,2,5},
        [78] = {3,3,0,0,3,6},
        [79] = {7,0,0,0,3,6},
        [80] = {5,2,0,0,4,8},
        [81] = {4,2,0,0,8,11},
        [82] = {4,2,0,0,9,12},
        [83] = {6,0,0,0,9,15},
        [84] = {2,2,2,0,12,14},
        [85] = {5,2,0,0,25,26},
        [86] = {6,2,0,0,26,32},
        [87] = {6,2,0,0,27,33},
        [88] = {5,0,0,0,36,37},
        [89] = {6,0,0,0,1,6},
        [90] = {6,0,0,0,1,8},
        -- Regime 91-100
        [91] = {6,0,0,0,2,6},
        [92] = {4,2,0,0,3,6},
        [93] = {4,3,0,0,3,6},
        [94] = {4,2,0,0,7,11},
        [95] = {3,3,0,0,8,12},
        [96] = {3,4,0,0,12,16},
        [97] = {4,4,0,0,26,32},
        [98] = {2,5,0,0,26,34},
        [99] = {3,5,0,0,27,33},
        [100] = {5,3,0,0,36,38},
        [101] = {3,2,0,0,41,44},
        [102] = {3,2,0,0,41,46},
        [103] = {3,2,0,0,43,47},
        [104] = {4,4,0,0,62,66},
        [105] = {4,5,0,0,64,68},
        [106] = {4,5,0,0,64,69},
        [107] = {7,3,0,0,66,74},
        [108] = {4,5,0,0,71,79},
        [109] = {10,0,0,0,30,34},
        [110] = {3,1,7,0,35,40},
        [111] = {3,1,7,0,35,44},
        [112] = {5,2,2,1,44,49},
        [113] = {3,3,2,1,45,49},
        [114] = {7,2,0,0,40,44},
        [115] = {7,3,0,0,41,46},
        [116] = {7,3,0,0,41,46},
        [117] = {7,3,0,0,42,47},
        [118] = {3,5,0,0,44,50},
        [119] = {3,3,0,0,60,65},
        [120] = {7,0,0,0,64,69},
        [121] = {7,0,0,0,65,69},
        [122] = {6,1,0,0,78,82},
        [123] = {6,1,0,0,79,82},
        [124] = {4,5,0,0,30,35},
        [125] = {7,4,0,0,32,37},
        [126] = {10,0,0,0,34,36},
        [127] = {4,6,0,0,34,38},
        [128] = {4,6,0,0,34,41},
        [129] = {3,6,0,0,35,39},
        [130] = {3,6,0,0,35,40},
        [131] = {10,0,0,0,40,44},
        [132] = {7,3,0,0,40,46},
        [133] = {10,0,0,0,45,49},
        [134] = {7,3,0,0,40,45},
        [135] = {5,1,4,0,44,49},
        [136] = {10,1,0,0,47,53},
        [137] = {2,8,0,0,51,56},
        [138] = {4,6,0,0,54,58},
        [139] = {5,2,0,0,66,72},
        [140] = {5,1,0,0,66,74},
        -- Regime 140-146
        [141] = {4,1,0,0,69,74},
        [142] = {8,3,0,0,72,76},
        [143] = {8,3,0,0,73,78},
        [144] = {11,0,0,0,75,78},
        [145] = {2,2,2,0,78,79},
        [146] = {2,2,2,0,78,79},
    -- ---------------------------------------------------------
    -- I know they prevent FoV/GoV page sign-up and FoV/GoV prevent registry.
    -- Need confirmation of retail behavior - Do they display in menu?
    -- ---------------------------------------------------------
    -- I'm pretty sure you can have an active page and OP at same time.
    -- They might still display on the review option though.
    -- ---------------------------------------------------------
        [602] = {4,1,0,0,3,5},
        [603] = {5,1,0,0,25,30},
        [604] = {4,2,0,0,26,30},
        [605] = {4,2,0,0,26,30},
        [606] = {4,2,0,0,30,34},
        [607] = {5,2,0,0,87,92},
        [609] = {3,3,0,0,88,90},
        [610] = {5,0,0,0,52,54},
        [611] = {4,2,0,0,52,59},
        [612] = {5,1,0,0,56,63},
        [613] = {9,0,0,0,65,68},
        [614] = {6,1,0,0,94,97},
        [615] = {6,1,0,0,95,97},
        [616] = {6,0,0,0,96,97},
        [617] = {2,5,0,0,95,99},
        [618] = {3,3,0,0,47,52},
        [619] = {2,2,2,0,52,57},
        [620] = {3,3,0,0,53,57},
        [621] = {3,4,0,0,60,65},
        [622] = {4,3,0,0,95,97},
        [623] = {5,2,0,0,95,98},
        [624] = {5,2,0,0,96,98},
        [625] = {8,2,0,0,94,99},
        [626] = {3,0,0,0,1,3},
        [627] = {3,0,0,0,2,4},
        [628] = {5,2,0,0,75,78},
        [629] = {5,2,0,0,75,79},
        [630] = {5,2,0,0,75,80},
        [631] = {3,3,0,0,3,8},
        [632] = {4,2,0,0,5,11},
        [633] = {2,2,2,0,12,16},
        [634] = {3,3,0,0,14,17},
        [635] = {2,2,2,0,21,23},
        [636] = {6,1,0,0,78,80},
        [637] = {5,2,0,0,77,80},
        [638] = {5,2,0,0,80,83},
        [639] = {4,1,0,0,3,8},
        [640] = {3,2,0,0,5,9},
        [641] = {3,2,0,0,11,14},
        -- 642-651
        [642] = {4,2,0,0,86,89},
        [643] = {5,2,0,0,86,90},
        [644] = {5,2,0,0,86,90},
        [645] = {2,2,2,0,90,91},
        [646] = {5,2,0,0,90,93},
        [647] = {2,3,0,0,1,6},
        [648] = {2,3,0,0,1,7},
        [649] = {3,2,0,0,15,20},
        [650] = {4,2,0,0,22,26},
        [651] = {3,3,0,0,78,82},
        [652] = {3,3,0,0,79,82},
        [653] = {2,4,0,0,81,83},
        [654] = {2,4,0,0,81,84},
        [655] = {3,3,0,0,18,21},
        [656] = {4,2,0,0,21,27},
        [657] = {5,1,0,0,17,26},
        [658] = {3,3,0,0,23,26},
        [659] = {4,2,0,0,26,28},
        [660] = {4,1,0,0,29,34},
        [661] = {3,3,0,0,84,86},
        [662] = {3,3,0,0,86,88},
        [663] = {1,1,1,1,10,14},
        [664] = {1,1,1,1,15,19},
        [665] = {1,1,1,1,20,24},
        [666] = {1,1,1,1,25,29},
        [667] = {1,1,1,1,30,34},
        [668] = {1,1,1,1,35,39},
        [669] = {5,1,0,0,81,85},
        [670] = {5,1,0,0,82,85},
        [671] = {6,0,0,0,42,46},
        [672] = {6,0,0,0,46,49},
        [673] = {4,2,0,0,51,54},
        [674] = {5,1,0,0,50,55},
        [675] = {3,3,0,0,53,56},
        [676] = {3,3,0,0,60,63},
        [677] = {3,3,0,0,91,95},
        [678] = {3,3,0,0,91,95},
        [679] = {6,0,0,0,20,27},
        [680] = {2,4,0,0,20,24},
        [681] = {2,4,0,0,21,26},
        [682] = {2,2,2,0,28,31},
        [683] = {3,3,0,0,30,34},
        [684] = {3,3,0,0,32,36},
        [685] = {2,5,0,0,85,87},
        [686] = {2,5,0,0,85,89},
        [687] = {3,3,0,0,40,44},
        [688] = {3,3,0,0,45,49},
        [689] = {3,3,0,0,49,52},
        [690] = {4,2,0,0,50,54},
        [691] = {2,2,2,0,53,58},
        -- 691-701
        [692] = {3,3,0,0,59,63},
        [693] = {4,3,0,0,91,93},
        [694] = {4,3,0,0,92,96},
        [695] = {3,2,0,0,15,18},
        [696] = {4,2,0,0,18,23},
        [697] = {2,4,0,0,22,26},
        [698] = {2,4,0,0,26,31},
        [699] = {4,2,0,0,26,31},
        [700] = {5,1,0,0,27,33},
        [701] = {3,3,0,0,83,85},
        [702] = {3,3,0,0,86,88},
        [703] = {4,2,0,0,40,43},
        [704] = {4,2,0,0,40,44},
        [705] = {2,4,0,0,46,49},
        [706] = {4,2,0,0,51,55},
        [707] = {3,3,0,0,52,58},
        [708] = {2,2,1,0,59,62},
        [709] = {5,2,0,0,91,96},
        [710] = {4,3,0,0,92,96},
        [711] = {4,2,0,0,40,43},
        [712] = {4,2,0,0,43,46},
        [713] = {5,1,0,0,50,55},
        [714] = {4,2,0,0,50,56},
        [715] = {5,1,0,0,50,58},
        [716] = {3,3,0,0,59,63},
        [717] = {4,2,0,0,95,99},
        [718] = {4,3,0,0,95,99},
        [719] = {3,3,0,0,60,63},
        [720] = {4,3,0,0,62,66},
        [721] = {4,3,0,0,62,67},
        [722] = {4,2,0,0,72,75},
        [723] = {3,4,0,0,72,76},
        [724] = {4,3,0,0,72,78},
        [725] = {3,3,0,0,74,78},
        [726] = {2,2,2,0,102,105},
        [727] = {2,4,0,0,20,26},
        [728] = {3,3,0,0,22,30},
        [729] = {4,2,0,0,23,31},
        [730] = {6,0,0,0,28,31},
        [731] = {3,3,0,0,29,33},
        [732] = {4,0,0,0,30,33},
        [733] = {6,0,0,0,35,37},
        [734] = {4,3,0,0,87,91},
        [735] = {3,3,0,0,60,64},
        [736] = {5,1,0,0,60,66},
        [737] = {3,3,0,0,60,66},
        [738] = {4,2,0,0,60,67},
        [739] = {3,3,0,0,63,69},
        [740] = {3,3,0,0,65,69},
        [741] = {3,3,0,0,77,80},
        -- 741-751
        [742] = {3,3,0,0,99,103},
        [743] = {10,0,0,0,72,72},
        [744] = {7,0,0,0,74,77},
        [745] = {7,0,0,0,75,78},
        [746] = {7,0,0,0,76,79},
        [747] = {7,0,0,0,77,80},
        [748] = {6,0,0,0,79,80},
        [749] = {10,0,0,0,71,71},
        [750] = {6,0,0,0,71,74},
        [751] = {7,0,0,0,75,80},
        [752] = {7,0,0,0,77,82},
        [753] = {7,0,0,0,79,82},
        [754] = {7,0,0,0,81,84},
        [756] = {4,1,0,0,61,68},
        [757] = {4,1,0,0,62,69},
        [758] = {3,2,0,0,62,73},
        [759] = {3,2,0,0,62,73},
        [760] = {4,2,0,0,69,74},
        [762] = {4,2,0,0,71,78},
        [763] = {2,2,1,0,44,49},
        [764] = {2,2,2,0,45,49},
        [765] = {3,2,1,0,65,68},
        [766] = {3,3,0,0,73,76},
        [767] = {5,1,0,0,75,78},
        [768] = {5,1,0,0,75,79},
        [769] = {4,2,0,0,76,80},
        [770] = {5,2,0,0,100,103},
        [771] = {2,3,0,0,45,49},
        [772] = {3,2,0,0,50,53},
        [773] = {3,2,0,0,50,54},
        [774] = {3,2,0,0,55,59},
        [775] = {4,1,0,0,70,74},
        [776] = {4,2,0,0,95,98},
        [777] = {3,3,0,0,25,30},
        [778] = {3,3,0,0,25,30},
        [779] = {3,3,0,0,25,30},
        [780] = {4,2,0,0,25,32},
        [781] = {4,2,0,0,25,35},
        [783] = {4,3,0,0,25,34},
        [784] = {4,4,0,0,30,34},
        [785] = {6,0,0,0,34,35},
        [787] = {2,2,2,0,62,69},
        [789] = {2,2,2,0,65,69},
        [790] = {3,3,0,0,51,57},
        [792] = {4,2,0,0,51,57},
        [793] = {3,3,0,0,61,63},
        -- 793-803
        [794] = {3,3,0,0,61,67},
        [795] = {3,3,0,0,61,68},
        [796] = {3,3,0,0,60,64},
        [797] = {4,2,0,0,60,67},
        [798] = {6,0,0,0,62,69},
        [799] = {4,2,0,0,62,69},
        [800] = {4,2,0,0,62,76},
        [801] = {5,0,0,0,73,81},
        [802] = {3,3,0,0,74,79},
        [803] = {4,2,0,0,75,80},
        [804] = {3,3,0,0,35,39},
        [805] = {2,4,0,0,37,41},
        [806] = {5,1,0,0,41,45},
        [807] = {2,2,2,0,43,48},
        [808] = {4,2,0,0,44,48},
        [809] = {3,3,0,0,62,67},
        [810] = {3,3,0,0,62,69},
        [811] = {3,3,0,0,66,69},
        [812] = {3,3,0,0,51,55},
        [813] = {3,3,0,0,51,58},
        [814] = {3,3,0,0,51,59},
        [815] = {7,0,0,0,52,59},
        [816] = {3,3,0,0,52,59},
        [817] = {3,3,0,0,56,59},
        [818] = {3,3,0,0,62,65},
        [819] = {3,3,0,0,65,69},
    };
    
    local a = {0,0,0,0,0,0};
    
    if regimeinfo[regimeid] then
        return regimeinfo[regimeid];
    else
        -- print("Warning: Regime ID not found! Returning blank array.");
        return a;
    end

end;
=======
-------------------------------------------------
--
-- Regime Info Database
--
-- Stores details on the number of monsters to kill
-- as well as the suggested level range.
-- n1,n2,n3,n4 = Number of monsters needed
-- sl = Start Level range
-- el = Level range
--
-- Example:
-- n1=6, n2=0, n3=0, n4=0, sl=1, el=6, Regime ID=1, produces:
-- Defeat the following monsters:
--  6 Worms
--  Level range 1 ~ 6
--  Area: West Ronfaure
-------------------------------------------------

function getRegimeInfo(regimeid)
    local regimeinfo = {
        [1] = {6,0,0,0,1,6},
        [2] = {6,0,0,0,2,6},
        [3] = {5,1,0,0,4,7},
        [4] = {4,2,0,0,4,8},
        [5] = {3,3,0,0,8,12},
        [6] = {8,0,0,0,12,13},
        [7] = {7,1,0,0,15,19},
        [8] = {6,2,0,0,15,22},
        [9] = {5,3,0,0,18,23},
        [10] = {4,4,0,0,20,23},
        [11] = {9,0,0,0,21,22},
        [12] = {8,1,0,0,21,23},
        [13] = {7,2,0,0,22,25},
        [14] = {6,3,0,0,24,25},
        [15] = {4,3,0,0,25,28},
        [16] = {6,0,0,0,1,6},
        [17] = {6,0,0,0,3,6},
        [18] = {5,1,0,0,3,7},
        [19] = {4,2,0,0,3,8},
        [20] = {3,3,0,0,10,12},
        [21] = {9,0,0,0,20,21},
        [22] = {8,1,0,0,20,22},
        [23] = {7,2,0,0,21,23},
        [24] = {6,3,0,0,22,25},
        [25] = {4,3,0,0,25,28},
        [26] = {6,0,0,0,1,5},
        [27] = {6,0,0,0,2,5},
        [28] = {5,1,0,0,3,8},
        [29] = {4,2,0,0,4,8},
        [30] = {3,3,0,0,7,12},
        [31] = {8,0,0,0,11,13},
        [32] = {7,1,0,0,15,19},
        [33] = {6,2,0,0,15,23},
        [34] = {5,3,0,0,20,24},
        [35] = {4,4,0,0,21,24},
        [36] = {9,0,0,0,20,21},
        [37] = {8,1,0,0,20,22},
        [38] = {7,2,0,0,21,23},
        [39] = {6,3,0,0,22,25},
        [40] = {4,3,0,0,25,28},
        -- Regime between 41-50
        [41] = {9,1,0,0,26,29},
        [42] = {8,2,0,0,26,29},
        [43] = {7,3,0,0,28,29},
        [44] = {6,4,0,0,28,30},
        [45] = {5,4,1,0,28,34},
        [46] = {9,2,0,0,34,38},
        [47] = {8,3,0,0,34,39},
        [48] = {7,4,0,0,37,42},
        [49] = {6,4,1,0,37,43},
        [50] = {5,4,2,0,40,43},
        [51] = {9,3,0,0,42,46},
        [52] = {8,4,0,0,42,45},
        [53] = {7,4,1,0,42,48},
        [54] = {6,4,2,0,42,48},
        [55] = {5,4,3,0,45,52},
        [56] = {6,1,0,0,4,8},
        [57] = {4,2,0,0,22,25},
        [58] = {8,2,0,0,15,18},
        [59] = {3,4,0,0,3,8},
        [60] = {5,4,1,0,22,25},
        [61] = {4,2,0,0,4,8},
        [62] = {4,3,0,0,22,27},
        [63] = {3,5,0,0,25,27},
        [64] = {6,0,0,0,1,5},
        [65] = {6,0,0,0,2,5},
        [66] = {7,0,0,0,2,6},
        [67] = {4,2,0,0,3,6},
        [68] = {4,2,0,0,4,8},
        [69] = {3,5,0,0,11,13},
        [70] = {5,3,0,0,11,14},
        [71] = {5,3,0,0,10,15},
        [72] = {5,2,0,0,23,26},
        [73] = {5,2,0,0,23,28},
        [74] = {5,2,2,0,26,32},
        [75] = {9,0,0,0,31,32},
        [76] = {6,0,0,0,1,6},
        [77] = {7,0,0,0,2,5},
        [78] = {3,3,0,0,3,6},
        [79] = {7,0,0,0,3,6},
        [80] = {5,2,0,0,4,8},
        [81] = {4,2,0,0,8,11},
        [82] = {4,2,0,0,9,12},
        [83] = {6,0,0,0,9,15},
        [84] = {2,2,2,0,12,14},
        [85] = {5,2,0,0,25,26},
        [86] = {6,2,0,0,26,32},
        [87] = {6,2,0,0,27,33},
        [88] = {5,0,0,0,36,37},
        [89] = {6,0,0,0,1,6},
        [90] = {6,0,0,0,1,8},
        -- Regime 91-100
        [91] = {6,0,0,0,2,6},
        [92] = {4,2,0,0,3,6},
        [93] = {4,3,0,0,3,6},
        [94] = {4,2,0,0,7,11},
        [95] = {3,3,0,0,8,12},
        [96] = {3,4,0,0,12,16},
        [97] = {4,4,0,0,26,32},
        [98] = {2,5,0,0,26,34},
        [99] = {3,5,0,0,27,33},
        [100] = {5,3,0,0,36,38},
        [101] = {3,2,0,0,41,44},
        [102] = {3,2,0,0,41,46},
        [103] = {3,2,0,0,43,47},
        [104] = {4,4,0,0,62,66},
        [105] = {4,5,0,0,64,68},
        [106] = {4,5,0,0,64,69},
        [107] = {7,3,0,0,66,74},
        [108] = {4,5,0,0,71,79},
        [109] = {10,0,0,0,30,34},
        [110] = {3,1,7,0,35,40},
        [111] = {3,1,7,0,35,44},
        [112] = {5,2,2,1,44,49},
        [113] = {3,3,2,1,45,49},
        [114] = {7,2,0,0,40,44},
        [115] = {7,3,0,0,41,46},
        [116] = {7,3,0,0,41,46},
        [117] = {7,3,0,0,42,47},
        [118] = {3,5,0,0,44,50},
        [119] = {3,3,0,0,60,65},
        [120] = {7,0,0,0,64,69},
        [121] = {7,0,0,0,65,69},
        [122] = {6,1,0,0,78,82},
        [123] = {6,1,0,0,79,82},
        [124] = {4,5,0,0,30,35},
        [125] = {7,4,0,0,32,37},
        [126] = {10,0,0,0,34,36},
        [127] = {4,6,0,0,34,38},
        [128] = {4,6,0,0,34,41},
        [129] = {3,6,0,0,35,39},
        [130] = {3,6,0,0,35,40},
        [131] = {10,0,0,0,40,44},
        [132] = {7,3,0,0,40,46},
        [133] = {10,0,0,0,45,49},
        [134] = {7,3,0,0,40,45},
        [135] = {5,1,4,0,44,49},
        [136] = {10,1,0,0,47,53},
        [137] = {2,8,0,0,51,56},
        [138] = {4,6,0,0,54,58},
        [139] = {5,2,0,0,66,72},
        [140] = {5,1,0,0,66,74},
        -- Regime 140-146
        [141] = {4,1,0,0,69,74},
        [142] = {8,3,0,0,72,76},
        [143] = {8,3,0,0,73,78},
        [144] = {11,0,0,0,75,78},
        [145] = {2,2,2,0,78,79},
        [146] = {2,2,2,0,78,79},
    -- ---------------------------------------------------------
    -- I know they prevent FoV/GoV page sign-up and FoV/GoV prevent registry.
    -- Need confirmation of retail behavior - Do they display in menu?
    -- ---------------------------------------------------------
    -- I'm pretty sure you can have an active page and OP at same time.
    -- They might still display on the review option though.
    -- ---------------------------------------------------------
        [602] = {4,1,0,0,3,5},
        [603] = {5,1,0,0,25,30},
        [604] = {4,2,0,0,26,30},
        [605] = {4,2,0,0,26,30},
        [606] = {4,2,0,0,30,34},
        [607] = {5,2,0,0,87,92},
        [608] = {3,3,0,0,88,90},
        [609] = {3,3,0,0,88,90},
        [610] = {5,0,0,0,52,54},
        [611] = {4,2,0,0,52,59},
        [612] = {5,1,0,0,56,63},
        [613] = {9,0,0,0,65,68},
        [614] = {6,1,0,0,94,97},
        [615] = {6,1,0,0,95,97},
        [616] = {6,0,0,0,96,97},
        [617] = {2,5,0,0,95,99},
        [618] = {3,3,0,0,47,52},
        [619] = {2,2,2,0,52,57},
        [620] = {3,3,0,0,53,57},
        [621] = {3,4,0,0,60,65},
        [622] = {4,3,0,0,95,97},
        [623] = {5,2,0,0,95,98},
        [624] = {5,2,0,0,96,98},
        [625] = {8,2,0,0,94,99},
        [626] = {3,0,0,0,1,3},
        [627] = {3,0,0,0,2,4},
        [628] = {5,2,0,0,75,78},
        [629] = {5,2,0,0,75,79},
        [630] = {5,2,0,0,75,80},
        [631] = {3,3,0,0,3,8},
        [632] = {4,2,0,0,5,11},
        [633] = {2,2,2,0,12,16},
        [634] = {3,3,0,0,14,17},
        [635] = {2,2,2,0,21,23},
        [636] = {6,1,0,0,78,80},
        [637] = {5,2,0,0,77,80},
        [638] = {5,2,0,0,80,83},
        [639] = {4,1,0,0,3,8},
        [640] = {3,2,0,0,5,9},
        [641] = {3,2,0,0,11,14},
        -- 642-651
        [642] = {4,2,0,0,86,89},
        [643] = {5,2,0,0,86,90},
        [644] = {5,2,0,0,86,90},
        [645] = {2,2,2,0,90,91},
        [646] = {5,2,0,0,90,93},
        [647] = {2,3,0,0,1,6},
        [648] = {2,3,0,0,1,7},
        [649] = {3,2,0,0,15,20},
        [650] = {4,2,0,0,22,26},
        [651] = {3,3,0,0,78,82},
        [652] = {3,3,0,0,79,82},
        [653] = {2,4,0,0,81,83},
        [654] = {2,4,0,0,81,84},
        [655] = {3,3,0,0,18,21},
        [656] = {4,2,0,0,21,27},
        [657] = {5,1,0,0,17,26},
        [658] = {3,3,0,0,23,26},
        [659] = {4,2,0,0,26,28},
        [660] = {4,1,0,0,29,34},
        [661] = {3,3,0,0,84,86},
        [662] = {3,3,0,0,86,88},
        [663] = {1,1,1,1,10,14},
        [664] = {1,1,1,1,15,19},
        [665] = {1,1,1,1,20,24},
        [666] = {1,1,1,1,25,29},
        [667] = {1,1,1,1,30,34},
        [668] = {1,1,1,1,35,39},
        [669] = {5,1,0,0,81,85},
        [670] = {5,1,0,0,82,85},
        [671] = {6,0,0,0,42,46},
        [672] = {6,0,0,0,46,49},
        [673] = {4,2,0,0,51,54},
        [674] = {5,1,0,0,50,55},
        [675] = {3,3,0,0,53,56},
        [676] = {3,3,0,0,60,63},
        [677] = {3,3,0,0,91,95},
        [678] = {3,3,0,0,91,95},
        [679] = {6,0,0,0,20,27},
        [680] = {2,4,0,0,20,24},
        [681] = {2,4,0,0,21,26},
        [682] = {2,2,2,0,28,31},
        [683] = {3,3,0,0,30,34},
        [684] = {3,3,0,0,32,36},
        [685] = {2,5,0,0,85,87},
        [686] = {2,5,0,0,85,89},
        [687] = {3,3,0,0,40,44},
        [688] = {3,3,0,0,45,49},
        [689] = {3,3,0,0,49,52},
        [690] = {4,2,0,0,50,54},
        [691] = {2,2,2,0,53,58},
        -- 691-701
        [692] = {3,3,0,0,59,63},
        [693] = {4,3,0,0,91,93},
        [694] = {4,3,0,0,92,96},
        [695] = {3,2,0,0,15,18},
        [696] = {4,2,0,0,18,23},
        [697] = {2,4,0,0,22,26},
        [698] = {2,4,0,0,26,31},
        [699] = {4,2,0,0,26,31},
        [700] = {5,1,0,0,27,33},
        [701] = {3,3,0,0,83,85},
        [702] = {3,3,0,0,86,88},
        [703] = {4,2,0,0,40,43},
        [704] = {4,2,0,0,40,44},
        [705] = {2,4,0,0,46,49},
        [706] = {4,2,0,0,51,55},
        [707] = {3,3,0,0,52,58},
        [708] = {2,2,1,0,59,62},
        [709] = {5,2,0,0,91,96},
        [710] = {4,3,0,0,92,96},
        [711] = {4,2,0,0,40,43},
        [712] = {4,2,0,0,43,46},
        [713] = {5,1,0,0,50,55},
        [714] = {4,2,0,0,50,56},
        [715] = {5,1,0,0,50,58},
        [716] = {3,3,0,0,59,63},
        [717] = {4,2,0,0,95,99},
        [718] = {4,3,0,0,95,99},
        [719] = {3,3,0,0,60,63},
        [720] = {4,3,0,0,62,66},
        [721] = {4,3,0,0,62,67},
        [722] = {4,2,0,0,72,75},
        [723] = {3,4,0,0,72,76},
        [724] = {4,3,0,0,72,78},
        [725] = {3,3,0,0,74,78},
        [726] = {2,2,2,0,102,105},
        [727] = {2,4,0,0,20,26},
        [728] = {3,3,0,0,22,30},
        [729] = {4,2,0,0,23,31},
        [730] = {6,0,0,0,28,31},
        [731] = {3,3,0,0,29,33},
        [732] = {4,0,0,0,30,33},
        [733] = {6,0,0,0,35,37},
        [734] = {4,3,0,0,87,91},
        [735] = {3,3,0,0,60,64},
        [736] = {5,1,0,0,60,66},
        [737] = {3,3,0,0,60,66},
        [738] = {4,2,0,0,60,67},
        [739] = {3,3,0,0,63,69},
        [740] = {3,3,0,0,65,69},
        [741] = {3,3,0,0,77,80},
        -- 741-751
        [742] = {3,3,0,0,99,103},
        [743] = {10,0,0,0,72,72},
        [744] = {7,0,0,0,74,77},
        [745] = {7,0,0,0,75,78},
        [746] = {7,0,0,0,76,79},
        [747] = {7,0,0,0,77,80},
        [748] = {6,0,0,0,79,80},
        [749] = {10,0,0,0,71,71},
        [750] = {6,0,0,0,71,74},
        [751] = {7,0,0,0,75,80},
        [752] = {7,0,0,0,77,82},
        [753] = {7,0,0,0,79,82},
        [754] = {7,0,0,0,81,84},
        [755] = {4,1,0,0,61,68},
        [756] = {4,1,0,0,61,68},
        [757] = {4,1,0,0,62,69},
        [758] = {3,2,0,0,62,73},
        [759] = {3,2,0,0,62,73},
        [760] = {4,2,0,0,69,74},
        [761] = {4,2,0,0,71,78},
        [762] = {4,2,0,0,71,78},
        [763] = {2,2,1,0,44,49},
        [764] = {2,2,2,0,45,49},
        [765] = {3,2,1,0,65,68},
        [766] = {3,3,0,0,73,76},
        [767] = {5,1,0,0,75,78},
        [768] = {5,1,0,0,75,79},
        [769] = {4,2,0,0,76,80},
        [770] = {5,2,0,0,100,103},
        [771] = {2,3,0,0,45,49},
        [772] = {3,2,0,0,50,53},
        [773] = {3,2,0,0,50,54},
        [774] = {3,2,0,0,55,59},
        [775] = {4,1,0,0,70,74},
        [776] = {4,2,0,0,95,98},
        [777] = {3,3,0,0,25,30},
        [778] = {3,3,0,0,25,30},
        [779] = {3,3,0,0,25,30},
        [780] = {4,2,0,0,25,32},
        [781] = {4,2,0,0,25,35},
        [782] = {4,3,0,0,25,34},
        [783] = {4,3,0,0,25,34},
        [784] = {4,4,0,0,30,34},
        [785] = {6,0,0,0,34,35},
        [786] = {2,2,2,0,62,69},
        [787] = {2,2,2,0,62,69},
        [788] = {2,2,2,0,65,69},
        [789] = {2,2,2,0,65,69},
        [790] = {3,3,0,0,51,57},
        [791] = {4,2,0,0,51,57},
        [792] = {4,2,0,0,51,57},
        [793] = {3,3,0,0,61,63},
        -- 793-803
        [794] = {3,3,0,0,61,67},
        [795] = {3,3,0,0,61,68},
        [796] = {3,3,0,0,60,64},
        [797] = {4,2,0,0,60,67},
        [798] = {6,0,0,0,62,69},
        [799] = {4,2,0,0,62,69},
        [800] = {4,2,0,0,62,76},
        [801] = {5,1,0,0,73,81},
        [802] = {3,3,0,0,74,79},
        [803] = {4,2,0,0,75,80},
        [804] = {3,3,0,0,35,39},
        [805] = {2,4,0,0,37,41},
        [806] = {5,1,0,0,41,45},
        [807] = {4,2,0,0,43,48},
        [808] = {4,2,0,0,44,48},
        [809] = {3,3,0,0,62,67},
        [810] = {3,3,0,0,62,69},
        [811] = {3,3,0,0,66,69},
        [812] = {3,3,0,0,51,55},
        [813] = {3,3,0,0,51,58},
        [814] = {3,3,0,0,51,59},
        [815] = {7,0,0,0,52,59},
        [816] = {3,3,0,0,52,59},
        [817] = {3,3,0,0,56,59},
        [818] = {3,3,0,0,62,65},
        [819] = {3,3,0,0,65,69},
    };
    
    local a = {0,0,0,0,0,0};
    
    if regimeinfo[regimeid] then
        return regimeinfo[regimeid];
    else
        -- print("Warning: Regime ID not found! Returning blank array.");
        return a;
    end

end;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
