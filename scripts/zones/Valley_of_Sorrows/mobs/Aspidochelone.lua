-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Aspidochelone
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    killer:addTitle(ASPIDOCHELONE_SINKER);

    -- Set Aspidochelone's Window Open Time
    if (LandKingSystem_HQ == 0 or LandKingSystem_HQ == 2) then
        local wait = 72 * 3600
        SetServerVariable("[POP]Aspidochelone", os.time(t) + wait); -- 3 days
        DeterMob(mob:getID(), true);
    end

    -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
    if (LandKingSystem_NQ == 0 or LandKingSystem_NQ == 2) then
        Adamantoise = 17301537;
        SetServerVariable("[PH]Aspidochelone", 0);
        DeterMob(Adamantoise, false);
        UpdateNMSpawnPoint(Adamantoise);
        GetMobByID(Adamantoise):setRespawnTime(math.random((75600),(86400)));
    end

end;

function onMobEngaged( mob, target )
   mob:setLocalVar( "outHPP", mob:getHHP() );
   mob:addMod( MOD_DEF, 300 );
end

function onMobFight(mob, target)
	
   local AspidInTime = mob:getLocalVar( "inTime" );
   local AspidOutTime = mob:getLocalVar( "outTime" );
   local AspidInHPP = mob:getLocalVar( "inHPP" );
   local AspidOutHPP = mob:getLocalVar( "outHPP" );
   if( ( mob:AnimationSub() == 0 or mob:AnimationSub() == 2 ) and AspidOutTime < os.time() ) then
      mob:SetMobSkillAttack(false);
      mob:SetAutoAttackEnabled(true);
      if( AspidOutTime < os.time() - 120 ) then
         enterShell( mob );
      elseif( mob:getHPP() < AspidOutHPP - 5 ) then -- if his last out hpp - 5 is greater than his current hpp, back in there buddy
         enterShell( mob );
      end
   elseif( mob:AnimationSub() == 1 ) then
      mob:SetAutoAttackEnabled(false);
      mob:SetMobSkillAttack(true);
      if( mob:getHPP() == 100 and AspidInTime < os.time() - 10 ) then
         exitShell( mob );
      elseif( mob:getHPP() > AspidInHPP + 30 ) then
         exitShell( mob );
      elseif( AspidInTime < os.time() - 120 ) then -- max intime of 2 minutes
         exitShell( mob );
      end
   end
end

function enterShell( aspid )
   aspid:addMod( MOD_REGEN, 300 );
   aspid:addMod( MOD_DEFP, 1000 );
   aspid:AnimationSub(1);
   aspid:speed( 0 );
   aspid:setLocalVar( "inTime", os.time() );
   aspid:setLocalVar( "inHPP", aspid:getHPP() );
end

function exitShell( aspid )
   aspid:delMod( MOD_REGEN, 300 );
   aspid:delMod( MOD_DEFP, 1000 );
   aspid:AnimationSub(2);
   aspid:speed( 40 );
   aspid:setLocalVar( "outTime", os.time() );
   aspid:setLocalVar( "outHPP", aspid:getHPP() );
end
