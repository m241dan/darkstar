-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Aspidochelone
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/melfnm");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
   DeterMob(17301537,true);   
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   killer:addTitle(ASPIDOCHELONE_SINKER);

   -- Set Aspidochelone's Window Open Time
   local wait = 72 * 3600
   local Adamantoise = 17301537;
   SetServerVariable("[POP]Aspidochelone", os.time(t) + wait); -- 3 days
   SetServerVariable("[PH]Aspidochelone", 0);
   SetServerVariable("[WindowOpen]Aspidochelone", os.time(t) + ( 21 * 3600 ) );
   onHNMInit( "Aspidochelone", Adamantoise, mob:getID() );
end;

function onMobEngaged( mob, target )
   mob:setLocalVar( "outHPP", mob:getHHP() );
end

function onMobSpawn( mob )
   mob:addMod( MOD_DEF, 300 );
   mob:addMod( MOD_MND, 10 );
   mob:addMod( MOD_INT, 10 );
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
   aspid:addMod( MOD_REGEN, 200 );
   aspid:addMod( MOD_DEFP, 1000 );
   aspid:AnimationSub(1);
   aspid:speed( 0 );
   aspid:setLocalVar( "inTime", os.time() );
   aspid:setLocalVar( "inHPP", aspid:getHPP() );
end

function exitShell( aspid )
   aspid:delMod( MOD_REGEN, 200 );
   aspid:delMod( MOD_DEFP, 1000 );
   aspid:AnimationSub(2);
   if( aspid:hasStatusEffect( EFFECT_BIND ) ~= true ) then
      aspid:speed( 40 );
   end
   aspid:setLocalVar( "outTime", os.time() );
   aspid:setLocalVar( "outHPP", aspid:getHPP() );
end
