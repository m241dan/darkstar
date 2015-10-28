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
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Rumble Crawler that spawns in place of Habetrot
    if(mob:getID() == 17428812) then
        GetNPCByID(17428871):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;
