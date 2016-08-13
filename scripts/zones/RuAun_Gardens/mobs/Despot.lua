-----------------------------------
-- Area: RuAun Gardens
--  NM:  Despot
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDespawn
-----------------------------------
function onMobDeath(mob,player,isKiller)
    checkRegime(player,mob,143,2);
    checkRegime(player,mob,144,1);
end;

function onMobDespawn(mob)
    -- Set Despot ToD
    SetServerVariable("[POP]Despot", os.time(t) + 7200); -- 2 hour
    DeterMob(mob:getID(), true);
end;

function onMobFight(mob,target)
   if( mob:checkDistance( target ) <= 3.9 and mob:getCurrentAction() == 1 ) then
      mob:useMobAbility(280);
   end
end
