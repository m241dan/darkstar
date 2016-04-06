<<<<<<< HEAD
-----------------------------------
-- Area: Shrine of Ru'Avitau
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
    startGov(GOV_EVENT_SHRINE_OF_RUAVITAU,player);
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,749,750,751,752,753,754,0,0,0,0);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,749,750,751,752,753,754,0,0,0,0,GOV_MSG_SHRINE_OF_RUAVITAU);
end;
=======
-----------------------------------
-- Area: Shrine of Ru'Avitau
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
    startGov(GOV_EVENT_SHRINE_OF_RUAVITAU,player);
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,749,750,751,752,753,754,0,0,0,0);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,749,750,751,752,753,754,0,0,0,0,GOV_MSG_SHRINE_OF_RUAVITAU);
end;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
