-----------------------------------
-- Area: Port Jeuno
-- NPC:  Guide Stone
-- @pos -149 -3 0 246
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   if( trade:getItemCount() ~= 1 ) then return; end
   local itemID = trade:getItem(0);
   if( oldNMaugtable[itemID] == nil ) then return; end

   onGuideStoneTrade(player,itemID,trade);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    player:messageSpecial(GUIDE_STONE);
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
