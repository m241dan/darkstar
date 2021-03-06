-----------------------------------
-- Ability: Rampart
-- Grants a Magic Shield effect and enhances defense for party members within area of effect.
-- Obtained: Paladin Level 62
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local iHead = player:getEquipID(SLOT_HEAD);
    local duration = 30;
    if (iHead == 15078 or iHeadt == 15251 ) then
       duration = 45;
    end
    target:addStatusEffect(EFFECT_MAGIC_SHIELD,1,0,duration);
end;
