-----------------------------------
-- Area: Caedarva Mire
--  MOB: Khimaira
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob,target)
   -- if wings are down and we are past our threshold, up they go!
   if( mob:AnimationSub() == 1 and mob:getLocalVar( "WingsUpAt" ) <= os.time() ) then
      mob:AnimationSub(0);
   end
end;

-----------------------------------
-- onCriticalHit
-----------------------------------
function onCriticalHit(mob)
   if( math.random(100) < 10 and mob:AnimationSub() == 0 ) then
      mob:AnimationSub(1);
      mob:setLocalVar( "WingsUpAt", os.time() + 480 )
   end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
   player:addTitle(KHIMAIRA_CARVER);
   if( isKiller ) then
      mob:setRespawnTime((math.random((0),(24))*3600)+172800); -- 48-72 hours proper 1 hour windows
   end
end;
