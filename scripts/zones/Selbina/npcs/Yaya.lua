-----------------------------------
-- Area: Selbina
-- NPC: Yaya
-- Starts Quest: Under the sea
-- @pos -19 -2 -16 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   if( trade:getGil() == 1 and trade:getItemCount() == 1 ) then
      stock = {
         0x1120, 750, -- Black Sole
         0x1109, 425, -- Nebimonite
         0x10D0, 775, -- Grimmonite
         0x116D, 700, -- Bastore Bream  
         0x117A, 675, -- Gigant Squid
         0x1132, 325, -- Red Terrapin
         0x1166,1100, -- Emperor Fish
         0x111F,1200, -- Gold Lobster
         0x111B,350,  -- Cheval Salmon
         0x1102,355,  -- Shining Trout
         0x10DC,1100, -- Armored Pisces
         0x117D, 900, -- Gavial Fish
         0x140F,1000, -- Rhinochimera
         0x1180,1500, -- Gugru Tuna
         0x1108,1000, -- Bastore Sardine
         
      };
      showShop( player, STATIC, stock );
      return;
   end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getFameLevel(SELBINA) >= 2 and player:getQuestStatus(OTHER_AREAS,UNDER_THE_SEA) == QUEST_AVAILABLE) then 
        player:startEvent(0x001f); -- Start quest "Under the sea"
    else
        player:startEvent(0x0099); -- Standard dialog
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
    if (csid == 0x001f) then 
        player:addQuest(OTHER_AREAS,UNDER_THE_SEA);
        player:setVar("underTheSeaVar",1);
    end
end;
