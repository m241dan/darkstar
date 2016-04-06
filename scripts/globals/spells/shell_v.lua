-----------------------------------------
-- Spell: Shell IV
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
<<<<<<< HEAD
    local power = (62/256)*100;
=======
    local power = 24;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
    local duration = 1800;

    local typeEffect = EFFECT_SHELL;
    if (target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end
    return typeEffect;
end;
