<<<<<<< HEAD
---------------------------------------------
-- Sulfurous_Breath
-- Deals Fire damage to enemies within a fan-shaped area.
-- Breath Attack
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:isBehind(mob, 48) == true) then
        return 1;
    else
        return 0;
    end;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = math.random((1),(3));

    local dmgmod = MobPhysicalMove(mob,target,skill,numhits,1,10,TP_NO_EFFECT,1,2,3);
    dmgmod.dmg = mobAddBonuses(mob,spell,target,dmgmod.dmg,ELE_FIRE);
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_FIRE,numhits);

    target:delHP(dmg);
    return dmg;
end
=======
---------------------------------------------
-- Sulfurous_Breath
-- Deals Fire damage to enemies within a fan-shaped area.
-- Breath Attack
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:isBehind(mob, 48) == true) then
        return 1;
    else
        return 0;
    end;
end;

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, ELE_FIRE, 700);

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
