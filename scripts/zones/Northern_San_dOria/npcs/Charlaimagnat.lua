-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Charlaimagnat
-- Completes the Quest "The Missing Piece" (started by Alfesar in Rabao) 
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(532,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
	starttime = player:getVar("TheMissingPiece_date");
	TheMissingPiece = player:getQuestStatus(OUTLANDS,THE_MISSING_PIECE);
	TheMissingPieceVar = player:getVar("TheMissingPieceVar");
	
	if(TheMissingPiece == QUEST_ACCEPTED and player:hasKeyItem(TABLET_OF_ANCIENT_MAGIC) 
		and player:hasKeyItem(LETTER_FROM_ALFESAR)) then
		player:startEvent(0x02bf); -- Delivering the KeyItems from Alfesar
	elseif(TheMissingPiece == QUEST_ACCEPTED and (starttime == realday or player:needToZone() == true) and TheMissingPieceVar == 3) then 
		player:startEvent(0x02c0); -- Waiting for JP Midnight
	elseif(TheMissingPiece == QUEST_ACCEPTED and starttime ~= realday and player:needToZone() == false) then 
		player:startEvent(0x02c1); -- Tablet Deciphered; Quest Complete
	else
		player:startEvent(0x02be); -- Standard dialog before "The Missing Piece"
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

	if(csid == 0x02bf) then
		player:delKeyItem(TABLET_OF_ANCIENT_MAGIC);
		player:delKeyItem(LETTER_FROM_ALFESAR);
		player:setVar("TheMissingPieceVar",3);
		player:setVar("TheMissingPiece_date", os.date("%j"));
		player:needToZone(true);
	elseif(csid == 0x02c1) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4729);
		else
			player:addItem(4729);
			player:messageSpecial(ITEM_OBTAINED,4729);			
			player:addTitle(ACQUIRER_OF_ANCIENT_ARCANUM);
			player:addFame(SANDORA,SAN_FAME*30);
			player:completeQuest(OUTLANDS,THE_MISSING_PIECE);
		end
	end
end;




