<<<<<<< HEAD
-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  Grounds Tome
-----------------------------------

require("scripts/globals/settings");
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
    startGov(GOV_EVENT_IFRITS_CAULDRON,player);
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,755,756,757,758,759,760,761,762,0,0);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,755,756,757,758,759,760,761,762,0,0,GOV_MSG_IFRITS_CAULDRON);
end;
=======
-----------------------------------
-- Area: Ifrit's Cauldron
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
    startGov(GOV_EVENT_IFRITS_CAULDRON,player);
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,755,756,757,758,759,760,761,762,0,0);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,755,756,757,758,759,760,761,762,0,0,GOV_MSG_IFRITS_CAULDRON);
end;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
