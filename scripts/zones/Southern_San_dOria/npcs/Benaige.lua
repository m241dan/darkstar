-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Benaige
-- Standard Merchant NPC
-- @zone 230 
-- @pos-142,-6 47
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        count = trade:getItemCount();
        MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    player:showText(npc,BENAIGE_SHOP_DIALOG);

	stock = {0x0274,234,	--Cinnamon
			 0x0275,43,	--Millioncorn

			 0x026e,43,	--Dried Marjoram
			 0x0262,54,	--San d'Orian Flour
			 0x0273,36,	--Maple Sugar
			 0x0730,1800,	--Semolina
			 0x165e,442,	--Zucchini
			 0x166c,511,	--Paprika

			 0x026d,25,	--Crying Mustard
			 0x0263,36,	--Rye Flour
			 0x03a8,14,	--Rock Salt
			 0x119d,10,	--Distilled Water
			 0x1472,198}	--Cibol
	 
	showShop(player, SANDORIA, stock);
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
