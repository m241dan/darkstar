-----------------------------------
-- Area: Temple of Uggalepih (159)
-- NPC:  qm8 (???) 
-- Notes: Used to spawn Habetrot
-- @pos -57.434 -8.484 55.317 0
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Ifrits_Cauldron/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade 12 La Theine Cabbages to pop Habetrot
	if(GetMobAction(17428811) == 0 and trade:hasItemQty(4366,12) and trade:getItemCount() == 12) then
		player:tradeComplete();
		SpawnMob(17428811,900):updateClaim(player); -- Spawn Habetrot
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
end;