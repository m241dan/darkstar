-----------------------------------
-- Area: Mount Zhayolm
-- NPC:  Cerberus
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob)
   mob:addMod( MOD_MDEF, 20 );
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   killer:addTitle(CERBERUS_MUZZLER);
   mob:setRespawnTime((math.random((0),(24))*3600)+172800); -- 48-72 hours proper 1 hour windows
end;

function onMobFight( mob, target )
   if( mob:getHPP() > 25 ) then
      mob:setMod( MOD_REGAIN, 10 )
   else
      mob:setMod( MOD_REGAIN, 70 )
   end
end
