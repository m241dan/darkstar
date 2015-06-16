local enspells = { EFFECT_ENFIRE, EFFECT_ENAERO, EFFECT_ENSTONE, EFFECT_ENTHUNDER, EFFECT_ENWATER };
local enspellstwo = { SUBEFFECT_PETRIFY, SUBEFFECT_PARALYSIS, SUBEFFECT_CURSE, SUBEFFECT_TP_DRAIN, SUBEFFECT_BLIND, SUBEFFECT_HP_DRAIN };
local absorb = { MOD_FIRE_ABSORB, MOD_EARTH_ABSORB, MOD_WATER_ABSORB, MOD_WIND_ABSORB, MOD_ICE_ABSORB, MOD_LTNG_ABSORB, MOD_LIGHT_ABSORB, MOD_DARK_ABSORB };

function onMobSpawn( mob )
   if( math.random(1,2) == 1 ) then
      mob:setMobMod( MOBMOD_ADD_EFFECT, mob:getShortID() );
      mob:setLocalVar( "enspell", enspellstwo[math.random(1, #enspellstwo)] );
   else
      MobBuffMove( mob, enspells[math.random(1,#enspells)], 50, 0, 0 );
   end
   mob:addMod( absorb[math.random(1, #absorb)], 100 );

   mob:addMod( MOD_INT, 100 );
   mob:addMod( MOD_MND, 20 );
   mob:addMod( MOD_DEF, 200 );
   mob:addMod( MOD_SLOWRES, 100 );
   mob:addMod( MOD_ELEGYRES, 100 );
   mob:setDelay(3000);
end;

function onAdditionalEffect(mob, target, damage)
   local enspell = mob:getLocalVar( "enspell" );
   if( enspell == SUBEFFECT_PETRIFY ) then
      if( not target:hasStatusEffect(EFFECT_PETRIFICATION) ) then
         target:addStatusEffect(EFFECT_PETRIFICATION, 1, 0, 4 );
      end
      return SUBEFFECT_PETRIFY, 160, EFFECT_PETRIFICATION;
   elseif( enspell == SUBEFFECT_PARALYSIS ) then
      if( not target:hasStatusEffect(EFFECT_PARALYSIS) ) then
         target:addStatusEffect(EFFECT_PARALYSIS, 17, 0, 30); -- Power needs verification/adjustment.
      end
      return SUBEFFECT_PARALYSIS, 160, EFFECT_PARALYSIS;
   elseif( enspell == SUBEFFECT_CURSE ) then
      if( not target:hasStatusEffect(EFFECT_CURSE) ) then
         target:addStatusEffect(EFFECT_CURSE_I, 5, 0, 30 );
      end
      return SUBEFFECT_CURSE, 160, EFFECT_CURSE_I;
   elseif( enspell == SUBEFFECT_TP_DRAIN ) then
      local tp = math.random(5,15);
      target:addTp(-tp);
      mob:addTp(tp);
      return SUBEFFECT_TP_DRAIN,165,tp;
   elseif( enspell == SUBEFFECT_HP_DRAIN ) then
      local drain = math.random(80,100);
      drain = finalMagicNonSpellAdjustments(target,mob,ELE_DARK,drain);
      return SUBEFFECT_HP_DRAIN, 161, mob:addHP(drain);
   elseif( enspell == SUBEFFECT_BLIND ) then
      if( not target:hasStatusEffect(EFFECT_BLIND) ) then
         target:addStatusEffect( EFFECT_BLINDNESS, 30, 0, 30 );
      end
      return SUBEFFECT_BLIND, 160, EFFECT_BLINDNESS
   end
   return 0, 0, 0;

end;

function onMobDeath(mob,killer)
end;

function onMobDespawn(mob, killer)
   GetNPCByID(17301590):setStatus(0);
end;
