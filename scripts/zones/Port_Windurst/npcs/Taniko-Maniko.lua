-----------------------------------
-- Area: Port Windurst
-- NPC: Taniko-Maniko
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,TANIKOMANIKO_SHOP_DIALOG);

    stock = {
        0x4181,  2542,     --Brass Zaghnal
        0x4302,  7128,     --Wrapped Bow
        0x43AB,   162,     --Ice Arrow
        0x43AC,   162,     --Lightning Arrow

        0x4015,   104,     --Cat Baghnakhs
        0x4001,   129,     --Cesti
        0x4109,  5864,     --Bone Pick
        0x4301,   482,     --Self Bow
        0x43A6,     3,     --Wooden Arrow
        0x439C,    54,     --Hawkeye
        0x4380,  1575,     --Boomerang

        0x4102,  4198,     --Bone Axe
        0x4180,   309,     --Bronze Zaghnal
        0x41C0,    97,     --Harpoon
        0x4300,    39,     --Shortbow
        0x43A7,     4,     --Bone Arrow
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
