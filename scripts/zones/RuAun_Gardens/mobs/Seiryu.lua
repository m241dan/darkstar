-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Seiryu
-- ID:    17309981
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
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:showText(mob,SKY_GOD_OFFSET + 10);
    GetNPCByID(17310052):hideNPC(900);
    SetDropRate(3117,1312,150);
    SetDropRate(3117,722,150);
end;

-----------------------------------
-- onMonsterMagicPrepare
-----------------------------------

function onMonsterMagicPrepare(mob,target)
    -- For some reason, this returns false even when Hundred Fists is active, so... yeah.
    -- Core does this:
    -- m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HUNDRED_FISTS,0,1,0,45));
    if (mob:hasStatusEffect(EFFECT_HUNDRED_FISTS,0) == false) then
        local rnd = math.random();
        if (rnd < 0.5) then
            return 186; -- aeroga 3
        elseif (rnd < 0.7) then
             return 157; -- aero 4
        elseif (rnd < 0.9) then
            return 208; -- tornado
        else
            return 237; -- choke
        end
    end
    return -1;
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, target, damage)
    local LV_diff = target:getMainLvl() - mob:getMainLvl();
    local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);
    local ranDmgMod = math.random(0,15)
    local dmg = INT_diff+LV_diff+ranDmgMod;
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    
    dmg = addBonusesAbility(mob, ELE_WIND, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_WIND,0);
    dmg = adjustForTarget(target,dmg,ELE_WIND);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_WIND,dmg);

    return SUBEFFECT_WIND_DAMAGE,163,dmg;
end;

function onMobFight(mob, target)
   if( mob:getCurrentAction() == 1 and mob:getLocalVar( "twohrused" ) == 0 ) then
      if( math.random(1, mob:getHPP() ) == 1 or math.random(1, mob:getHPP() ) == 1 or mob:getHPP() < 25 ) then
         mob:useMobAbility(434);
         mob:setLocalVar( "twohrused", 1 )
      end
   end
end
