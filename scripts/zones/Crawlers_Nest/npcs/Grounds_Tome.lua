<<<<<<< HEAD
-----------------------------------
-- Area: Crawlers Nest
-- NPC:  Grounds Tome
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/groundsofvalor"] = nil;
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   onGroundsTombTrade( player, trade );
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    startGov(GOV_EVENT_CRAWLERS_NEST,player);
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,687,689,690,691,692,693,694,695,0,0);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,687,689,690,691,692,693,694,695,0,0,GOV_MSG_CRAWLERS_NEST);
end;
=======
-----------------------------------
-- Area: Crawlers Nest
-- NPC:  Grounds Tome
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    startGov(GOV_EVENT_CRAWLERS_NEST,player);
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,687,688,689,690,691,692,693,694,0,0);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,687,689,690,691,692,693,694,695,0,0,GOV_MSG_CRAWLERS_NEST);
end;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
