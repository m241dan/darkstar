<<<<<<< HEAD
-----------------------------------    
-- Area: Konschtat Highlands
-- Field Manual    
-----------------------------------    
    
require("scripts/globals/settings");    
require("scripts/globals/fieldsofvalor");    
    
-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)    
    startFov(FOV_EVENT_KONSCHTAT,player);
end;    
    
-----------------------------------    
-- onTrade Action    
-----------------------------------    
    
function onTrade(player,npc,trade)    
   onFieldManualTrade( player, trade );
end;    
    
-----------------------------------    
-- onEventSelection    
-----------------------------------    
    
function onEventUpdate(player,csid,menuchoice)    
    updateFov(player,csid,menuchoice,20,81,82,83,84);
end;    
    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
    finishFov(player,csid,option,20,81,82,83,84,FOV_MSG_KONSCHTAT);
end;    
=======
-----------------------------------    
-- Area: Konschtat Highlands
-- Field Manual    
-----------------------------------    
    
require("scripts/globals/settings");    
require("scripts/globals/fieldsofvalor");    
    
-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)    
    startFov(FOV_EVENT_KONSCHTAT,player);
end;    
    
-----------------------------------    
-- onTrade Action    
-----------------------------------    
    
function onTrade(player,npc,trade)    
end;    
    
-----------------------------------    
-- onEventSelection    
-----------------------------------    
    
function onEventUpdate(player,csid,menuchoice)    
    updateFov(player,csid,menuchoice,20,81,82,83,84);
end;    
    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
    finishFov(player,csid,option,20,81,82,83,84,FOV_MSG_KONSCHTAT);
end;    
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
