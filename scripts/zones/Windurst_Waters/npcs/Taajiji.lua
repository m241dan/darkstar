-----------------------------------
-- Area: Windurst Waters
-- NPC:  Taajiji
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,TAAJIJI_SHOP_DIALOG);

    stock = {
        0x113B,   756,     --Dhalmel Pie
        0x1152,  5050,     --Mushroom Risotto
        0x11CA, 12762,     --Shallops Tropicale
        0x1129,   984,     --Orange Kuchen

        0x119A,  5216,     --Mutton Tortilla
        0x1158,  6064,     --Whitefish Stew
        0x11DC,  1669,     --Beaugreen Sautee
        0x1146,   184,     --Orange Juice
        0x1156,  1324,     --Dhalmel Steak

        0x1138,   128,     --Tortilla
        0x118C,   552,     --Puls
        0x1151,  2387,     --Dhalmel Stew
        0x119D,    10,     --Distilled Water
        0x118D,   184,     --Windurstian Tea
        0x11CB,  1711,     --Windurst Salad
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
