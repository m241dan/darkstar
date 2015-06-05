-----------------------------------
--
-- Zone: Valley_of_Sorrows (128)
--
-----------------------------------
package.loaded["scripts/zones/Valley_of_Sorrows/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Valley_of_Sorrows/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17301588,17301589};

    SetFieldManual(manuals);

    -- Adamantoise
    local Adamantoise = 17301537;
    local Aspidochelone = 17301538;
    local ToD     = GetServerVariable("[POP]Aspidochelone");
    local kills   = GetServerVariable("[PH]Aspidochelone");
    if (ToD <= os.time(t) and GetMobAction(Aspidochelone) == 0) then
       if ( math.random((1),(5)) == 3 or kills > 6) then
          SetRespawnTime(Aspidochelone, 900, 10800 );
       else
          SetRespawnTime(Adamantoise, 900, 10800 );
       end
    else
       SetRespawnTime(Adamantoise, 900, 10800 );
    end
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
	local cs = -1;

	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		player:setPos(45.25,-2.115,-140.562,0);
	end

	return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;
