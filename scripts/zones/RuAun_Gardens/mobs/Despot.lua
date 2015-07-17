-----------------------------------
-- Area: RuAun Gardens
-- MOB:  Despot
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob,killer)
    checkRegime(killer,mob,143,2);
    checkRegime(killer,mob,144,1);

    -- Set Despot ToD
    SetServerVariable("[POP]Despot", os.time(t) + 7200); -- 2 hour
    DeterMob(mob:getID(), true);

end;

function onMobFight(mob,target)
   if( mob:checkDistance( target ) <= 3.9 and mob:getCurrentAction() == 1 ) then
      mob:useMobAbility(280);
   end
end
