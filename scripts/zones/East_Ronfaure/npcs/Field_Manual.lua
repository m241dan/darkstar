-----------------------------------    
-- Field Manual    
-- Area: East Ronfaure    
-----------------------------------    
    
require("scripts/globals/settings");    
require("scripts/globals/fieldsofvalor");    
    
-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)    
    startFov(FOV_EVENT_EAST_RONFAURE,player);
end;    
    
-----------------------------------    
-- onTrade Action    
-----------------------------------    
    
function onTrade(player,npc,trade)    
<<<<<<< HEAD
   onFieldManualTrade( player, trade );
=======
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
end;    
    
-----------------------------------    
-- onEventSelection    
-----------------------------------    
    
function onEventUpdate(player,csid,menuchoice)    
    updateFov(player,csid,menuchoice,64,65,66,67,68);
end;    
    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
    finishFov(player,csid,option,64,65,66,67,68,FOV_MSG_EAST_RONFAURE);
end;    
