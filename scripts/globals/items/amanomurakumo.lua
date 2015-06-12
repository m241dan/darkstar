-----------------------------------------
-- ID: 18318
-- Item: Amanomurakumo
-- Additional Effect: 10% Attack Down
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 10;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        target:delStatusEffect(EFFECT_ATTACK_BOOST);
        target:addStatusEffect(EFFECT_ATTACK_DOWN, 10, 0, 60); -- Power needs verification/correction
        return SUBEFFECT_ATTACK_DOWN, 160, EFFECT_ATTACK_DOWN;
    end
end;