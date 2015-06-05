-----------------------------------
--
-- Zone: Behemoths_Dominion (127)
--
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Behemoths_Dominion/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17297487};
    
    SetFieldManual(manuals);
    
   -- Behemoth
   local Behemoth      = 17297440;
   local King_Behemoth = 17297441;
   local ToD     = GetServerVariable("[POP]King_Behemoth");
   local kills   = GetServerVariable("[PH]King_Behemoth");
   if (ToD <= os.time(t) and GetMobAction(King_Behemoth) == 0) then
      if (math.random((1),(5)) == 3 or kills > 6) then
         SetRespawnTime(King_Behemoth, 900, 10800);
      else
         SetRespawnTime(Behemoth, 900, 10800);
      end
   else
      SetRespawnTime(Behemoth, 900, 10800);
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
		player:setPos(358.134,24.806,-60.001,123);
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
