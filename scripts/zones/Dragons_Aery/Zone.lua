-----------------------------------
--
-- Zone: Dragons_Aery (154)
--
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Dragons_Aery/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

   -- Fafnir
   local Fafnir  = 17408018;
   local Nidhogg = 17408019;
   local ToD     = GetServerVariable("[POP]Nidhogg");
   local kills   = GetServerVariable("[PH]Nidhogg");
   if (ToD <= os.time(t) and GetMobAction(Nidhogg) == 0) then
      if (math.random((1),(5)) == 3 or kills > 6) then
         SetRespawnTime(Nidhogg, 900, 10800);
      else
         SetRespawnTime(Fafnir, 900, 10800);
      end
   else
      SetRespawnTime(Fafnir, 900, 10800);
   end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
	local cs = -1;

	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		player:setPos(-60.006,-2.915,-39.501,202);
	end

	return cs;
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
