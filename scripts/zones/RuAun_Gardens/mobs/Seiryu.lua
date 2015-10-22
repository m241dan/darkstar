-----------------------------------
-- Area: Ru'Aun Gardens
--  NPC: Seiryu
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
   mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
   mob:addMod( MOD_STUNRES, -20 );
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
    GetNPCByID(17310052):hideNPC(120);
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
    local dmg = math.random(130,150)
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    
    dmg = addBonusesAbility(mob, ELE_WIND, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_WIND,0);
    dmg = adjustForTarget(target,dmg,ELE_WIND);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_WIND,dmg);

    return SUBEFFECT_WIND_DAMAGE,MSGBASIC_ADD_EFFECT_DMG,dmg;
end;

function onMobFight(mob, target)
   if( mob:getCurrentAction() == 1 and mob:getLocalVar( "twohrused" ) == 0 ) then
      if( math.random(1, mob:getHPP() ) == 1 or math.random(1, mob:getHPP() ) == 1 or mob:getHPP() < 25 ) then
         mob:useMobAbility(434);
         mob:setLocalVar( "twohrused", 1 )
      end
   end
end
