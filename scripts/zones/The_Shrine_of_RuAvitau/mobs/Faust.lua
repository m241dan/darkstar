-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Faust
-----------------------------------

-- TODO: Faust should WS ~3 times in a row each time.

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	mob:setRespawnTime(math.random((10800),(21600))); -- respawn 3-6 hrs
end;

function onMobFight(mob,target)
   typhoon = mob:getLocalVar( "FaustTyphoon" )
   if( mob:checkDistance( target ) <= 5.9 and mob:getCurrentAction() == 1 and os.time() > typhoon ) then
      mob:useMobAbility(283);
      SetServerVariable( "FaustTyphoon", os.time() + 10 );
   end
end
