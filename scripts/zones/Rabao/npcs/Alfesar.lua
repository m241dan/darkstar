-----------------------------------
-- Area: Rabao
-- NPC: Alfesar
-- Standard Info NPC
--Starts The Missing Piece
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
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
	TheMissingPiece = player:getQuestStatus(OUTLANDS,THE_MISSING_PIECE);
	TheMissingPieceVar = player:getVar("TheMissingPieceVar");
	
	if(TheMissingPiece == QUEST_AVAILABLE and player:getFameLevel(4) >= 4 and player:getMainLvl() >= 10) then
		-- Start quest "The Missing Piece"
		player:startEvent(0x0006,ANCIENT_TABLET_FRAGMENT,ANCIENT_TABLET_FRAGMENT);
	elseif(TheMissingPiece == QUEST_ACCEPTED and player:hasKeyItem(ANCIENT_TABLET_FRAGMENT)) then
		-- Obtain KIs to give to Charlaimagnat
		player:startEvent(0x0008,ANCIENT_TABLET_FRAGMENT,TABLET_OF_ANCIENT_MAGIC);
	elseif(TheMissingPiece == QUEST_ACCEPTED and TheMissingPieceVar == 1) then
		-- Haven't been to Quicksand Caves
		player:startEvent(0x0007,ANCIENT_TABLET_FRAGMENT);  
	elseif(TheMissingPiece == QUEST_ACCEPTED and TheMissingPieceVar == 2) then
		-- Haven't spoken to Charlaimagnat
		player:startEvent(0x0009,0,TABLET_OF_ANCIENT_MAGIC); 
	elseif(TheMissingPiece == QUEST_ACCEPTED and TheMissingPieceVar == 3) then
		-- Spoke to Charlaimagnat, waiting for JP Midnight
		player:startEvent(0x000A,0,TABLET_OF_ANCIENT_MAGIC); 
	elseif(TheMissingPiece == QUEST_COMPLETED) then
		-- Standard dialog after completing "The Missing Piece"
		player:startEvent(0x000B); 
	else
		-- Standard dialog before "The Missing Piece"
		player:startEvent(0x0034); 
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
		player:addQuest(OUTLANDS,THE_MISSING_PIECE);
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



