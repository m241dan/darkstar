-----------------------------------
-- Area: Temple Of Uggalepih (159)
-- MOB:  Rumble Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	checkGoVregime(killer,mob,791,2);
    
	-- Hide the ??? (qm8) if this Rumble Crawler spawned instead of Habetrot
	if (mob:getID() == 17428812) then
		GetNPCByID(17428850):hideNPC(900); -- 15min, qm8 in npc_list
	end
end;