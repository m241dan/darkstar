-----------------------------------------
-- Spell: Stun
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local duration = 5;

	local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
	local resist = applyResistanceEffect(caster,spell,target,dINT,37,0,EFFECT_STUN);
	if(resist <= (1/16)) then
		-- resisted!
		spell:setMsg(85);
		return 0;
	end

	if(target:hasStatusEffect(EFFECT_STUN)) then
		-- no effect
		spell:setMsg(75);
	else
        duration = duration * resist;
        if( duration < 1 ) then
           duration = 1;
        end
        if(target:addStatusEffect(EFFECT_STUN,1,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
	end

	return EFFECT_STUN;
end;
