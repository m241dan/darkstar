oldNMaugtable = {}
oldNMaugtable[15351] = { 553, 1, 130, 2 } -- Bounding Boots - +2 DEX +2 AGI +3 attack +3 ranged attack
oldNMaugtable[15224] = { 553, 1, 130, 2 } -- Empress Hairpin: +2 DEX +2 AGI +3 attack +3 ranged attack
oldNMaugtable[14986] = { 23, 6, 514, 1 } -- Ochimusha's Kote: +7 accuracy + 2 VIT
oldNMaugtable[15737] = { 23, 3, 25, 3 } -- Sarutobi Kyahan: +4 attack +4 accuracy
oldNMaugtable[15515] = { 130, 4, 0, 0 } -- Peacock Amulet: +5 attack +5 ranged attack
oldNMaugtable[15899] = { 23, 6, 25, 2 } -- Velocious Belt: +7 accuracy +3 attack
oldNMaugtable[15736] = { 31, 14, 0, 0 } -- Trotter Boots: +15 evasion
oldNMaugtable[18587] = { 329, 4, 40, 4 } -- Dryad Staff: +5% Cure potency, -5 enmity
oldNMaugtable[15551] = { 550, 1, 0, 0 } -- Shikaree Ring: +2 DEX +2 STR 

function onGuideStoneTrade( player, itemID, trade )
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs);

   player:tradeComplete();
   player:addItem( itemID, 1, oldNMaugtable[itemID][1], oldNMaugtable[itemID][2], oldNMaugtable[itemID][3], oldNMaugtable[itemID][4] );
   player:messageSpecial( ITEM_OBTAINED, itemID );
end;
