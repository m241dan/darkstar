-----------------------------------
-- Area: Rabao
-- NPC: Alfesar
-- Starts Quest: The Missing Piece (finished by Charlaimagnat - Northern San d'Oria)
-- @pos 129 -6 96 231
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");

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
		
	if(TheMissingPiece == QUEST_COMPLETED) then
		player:startEvent(0x000B); -- Standard dialog after completing "The Missing Piece"
	elseif(TheMissingPiece == QUEST_ACCEPTED and TheMissingPieceVar == 3) then
		player:startEvent(0x000A); -- Spoke to Charlaimagnat, waiting for JP Midnight
	elseif(TheMissingPiece == QUEST_ACCEPTED and TheMissingPieceVar == 2) then
		player:startEvent(0x0009); -- Haven't spoken to Charlaimagnat	
	elseif(TheMissingPiece == QUEST_ACCEPTED and player:hasKeyItem(ANCIENT_TABLET_FRAGMENT)) then
		player:startEvent(0x0008); -- Obtain KIs to give to Charlaimagnat
	elseif(TheMissingPiece == QUEST_ACCEPTED and TheMissingPieceVar == 1) then
		player:startEvent(0x0007); -- Haven't been to Quicksand Caves
	elseif(TheMissingPiece == QUEST_AVAILABLE and player:getFameLevel(OTHER_AREAS) >= 4 and player:getMainLvl() >= 10) then
		player:startEvent(0x0006); -- Start quest "The Missing Piece"
	else
		player:startEvent(0x0034); -- Standard dialog before "The Missing Piece"
	end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(csid == 0x0006) then
		player:addQuest(OTHER_AREAS,THE_MISSING_PIECE);
		player:setVar("TheMissingPieceVar",1);
	elseif(csid == 0x0008)	then
		player:setVar("TheMissingPieceVar",2);
		player:delKeyItem(ANCIENT_TABLET_FRAGMENT);
		player:addKeyItem(TABLET_OF_ANCIENT_MAGIC);
		player:addKeyItem(LETTER_FROM_ALFESAR);
		player:messageSpecial(KEYITEM_OBTAINED,TABLET_OF_ANCIENT_MAGIC);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_ALFESAR);
	end
end;



