-----------------------------------
-- Area: Quicksand Caves
-- NPC:  ??? (qm5) - Key Item for Quest "The Missing Piece"
-- @pos 771.31 -0.996 -419.256 173 (starting pos)
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TheMissingPiece = player:getQuestStatus(OTHER_AREAS,THE_MISSING_PIECE);
	TheMissingPieceVar = player:getVar("TheMissingPieceVar");
	
    if(TheMissingPiece == QUEST_ACCEPTED and TheMissingPieceVar == 1 and
		(not player:hasKeyItem(ANCIENT_TABLET_FRAGMENT))) then
		player:addKeyItem(ANCIENT_TABLET_FRAGMENT);
		player:messageSpecial(KEYITEM_OBTAINED,ANCIENT_TABLET_FRAGMENT);
		
		-- Change's the npc's spawn point
		npc:hideNPC();
		
		local randpos = math.random(1,5);	
		switch (randpos): caseof
		{
			[1] = function (x) npc:setPos(771.31,-0.996,-419.256); end, 
			[2] = function (x) npc:setPos(765,2,-566); end, 
			[3] = function (x) npc:setPos(661,0,-541); end, 
			[4] = function (x) npc:setPos(428,-17,-739); end,  
			[5] = function (x) npc:setPos(784,-16,-826); end, 
		} 
	else
       player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;