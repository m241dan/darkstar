<<<<<<< HEAD
-----------------------------------
-- Area: Selbina
-- NPC: Dohdjuma
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/shop");
package.loaded["scripts/globals/melfaugments"] = nil;
require("scripts/globals/melfaugments" );

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   onAugmentTrade( player, trade );   
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,DOHDJUMA_SHOP_DIALOG);

stock = {0x0263,36,	--Rye Flour
	 0x1393,233,	--Scroll of Sheepfoe Mambo
	 0x1036,2335,	--Eye Drops
	 0x1034,284,	--Antidote
	 0x119D,10,	--Distilled Water
	 0x1010,819,	--Potion
	 0x43F3,10,	--Lugworm
	 0x111A,54,	--Selbina Milk
	 0x118A,432,	--Pickled Herring
	 0x11CF,4485,	--Herb Quus
	 0x0b32,9200,	--Selbina Waystone
         
	}
showShop(player, STATIC, stock);
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



=======
-----------------------------------
-- Area: Selbina
-- NPC: Dohdjuma
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/shop");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,DOHDJUMA_SHOP_DIALOG);

stock = {0x0263,36,    --Rye Flour
     0x1393,233,    --Scroll of Sheepfoe Mambo
     0x1036,2335,    --Eye Drops
     0x1034,284,    --Antidote
     0x119D,10,    --Distilled Water
     0x1010,819,    --Potion
     0x43F3,10,    --Lugworm
     0x111A,54,    --Selbina Milk
     0x118A,432,    --Pickled Herring
     0x11CF,4485,    --Herb Quus
     0x0b32,9200}    --Selbina Waystone
 
showShop(player, STATIC, stock);
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



>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
