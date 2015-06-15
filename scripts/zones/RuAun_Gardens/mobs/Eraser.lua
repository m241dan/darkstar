-----------------------------------	
-- Area: RuAun Gardens	
-- MOB:  Eraser (Monster)	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
require("scripts/globals/status");	

local job_table = { JOB_THF, JOB_DRK, JOB_WHM, JOB_MNK, JOB_BRD };

local enspells = { EFFECT_ENFIRE, EFFECT_ENAERO, EFFECT_ENSTONE, EFFECT_ENTHUNDER, EFFECT_ENWATER };

local enspikes = { EFFECT_BLAZE_SPIKES, EFFECT_ICE_SPIKES, EFFECT_SHOCK_SPIKES };

local absorb = { MOD_FIRE_ABSORB, MOD_EARTH_ABSORB, MOD_WATER_ABSORB, MOD_WIND_ABSORB, MOD_ICE_ABSORB, MOD_LTNG_ABSORB, MOD_LIGHT_ABSORB, MOD_DARK_ABSORB };
};

-----------------------------------
-- onMobSpawn
-----------------------------------
function onMobSpawn(mob)
   local job = mob:getMainJob();

   -- general mods
   mob:setMod( MOD_DOUBLE_ATTACK, 20 );
   mob:addMod( MOD_ACC, 100 );
   mob:setMobMod( MOBMOD_MAGIC_COOL, 15 );


   -- job specific mods
   if( job == JOB_THF ) then
      mob:addMod( MOD_TRIPLE_ATTACK, 80 );
   elseif( job == JOB_MNK ) then
      mob:addMod( MOD_DOUBLE_ATTACK, 30 );
      mob:addMod( MOD_QUAD_ATTACK, 50 );
   end

   if( math.random((1),(3)) == 2 ) then
      MobBuffMove( mob, enspells[math.random(1,#enspells)], 65, 0, 0 );
   end

   if( math.random((1),(3)) == 2 ) then
      MobBuffMove( mob, enspikes[math.random(1,#enspikes)], 40, 0, 0 );
   end

   if( math.random((1),(3)) == 2 ) then
      mob:addMod( absorb[math.random(1, #absorb)], 100 );
   end

   local random = math.random(1,5);

   if( local == 1 ) then
      mob:addMod( MOD_REGEN, 50 );
   elseif( local == 2 ) then
      mob:addStatusEffect(EFFECT_BLINK, 9, 0, 0 );
   end
   
end;

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,143,2);
	checkRegime(killer,mob,144,1);
end;	

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob,killer)
   mob:changeMobJob( job_table[math.random(1, #job_table)] );
   GetNPCByID(17310106):setStatus(0);
end;

function onMobFight( mob, target )
end;
