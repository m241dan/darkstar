-----------------------------------    
-- Area: Valkurm Dunes    
-- NPC:  Field Manual    
-----------------------------------    
    
require("scripts/globals/settings");    
require("scripts/globals/fieldsofvalor");    
    
-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)    
    startFov(FOV_EVENT_VALKURM,player);
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
    updateFov(player,csid,menuchoice,7,8,9,10,57);
end;    
    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
    finishFov(player,csid,option,7,8,9,10,57,FOV_MSG_VALKURM);
end;    
