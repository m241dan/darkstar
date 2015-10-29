package.loaded["scripts/globals/melfaugments"] = nil;
require("scripts/globals/melfaugments");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   onFieldParchmentTrade(npc,player,trade);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   onFieldParchmentTrigger(npc, player);
end;
