-----------------------------------
-- Area: Windurst Waters
-- NPC:  Upih Khachla
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/events/harvest_festivals")
require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    onHalloweenTrade(player,trade,npc);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,UPIHKHACHLA_SHOP_DIALOG);

    stock = {
        0x43A1,  1107,     --Grenade
        0x1010,   837,     --Potion
        0x03B7,   108,     --Wijnruit

        0x027C,   119,     --Chamomile
        0x1037,   736,     --Echo Drops
        0x1020,  4445,     --Ether

        0x1034,   290,     --Antidote
        0x0764,  3960,     --Desalinator
        0x026E,    44,     --Dried Marjoram
        0x1036,  2387,     --Eye Drops
        0x025D,   180,     --Pickaxe
        0x0765,  3960,     --Salinator
        0x03FC,   276,     --Sickle
        0x04D9,   354,     --Twinkle Powder
	0x03FE,  3643,     --Thief's Tools
        0x03FF,  5520,     --Living Key
		    }               

  
    showShop(player, WINDURST, stock);

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
