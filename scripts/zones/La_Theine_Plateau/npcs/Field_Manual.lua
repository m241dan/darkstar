-----------------------------------    
-- Field Manual    
-- Area: La Theine Plateau    
-----------------------------------    
    
require("scripts/globals/settings");    
require("scripts/globals/fieldsofvalor");    
    
-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)    
    startFov(FOV_EVENT_LA_THEINE,player);
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
    updateFov(player,csid,menuchoice,5,6,69,70,71);
end;    
    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
    finishFov(player,csid,option,5,6,69,70,71,FOV_MSG_LA_THEINE);
end;    
