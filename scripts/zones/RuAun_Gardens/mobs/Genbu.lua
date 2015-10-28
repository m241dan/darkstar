-----------------------------------
-- Area: Ru'Aun Gardens
--  NPC: Genbu
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
   mob:addMod( MOD_BINDRES, 20 );
   mob:addMod( MOD_STUNRES, -20 );
   mob:speed(32);
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(140,160)
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    
    dmg = addBonusesAbility(mob, ELE_WATER, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_WATER,0);
    dmg = adjustForTarget(target,dmg,ELE_WATER);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_WATER,dmg);

    return SUBEFFECT_WATER_DAMAGE,MSGBASIC_ADD_EFFECT_DMG,dmg;
end;

function onMobFight( mob, target )
   if( mob:getCurrentAction() == 1 and mob:getLocalVar( "twohrused" ) == 0 ) then
      if( math.random(1, mob:getHPP() ) == 1 or math.random(1, mob:getHPP() ) == 1 or mob:getHPP() < 25 ) then
         mob:useMobAbility(438);
         mob:setLocalVar( "twohrused", 1 )
      end
   end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:showText(mob,SKY_GOD_OFFSET + 6);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17310099):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
