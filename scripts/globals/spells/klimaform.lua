--------------------------------------
-- 	Spell: Windstorm
-- 	Changes the weather around target party member to "windy."
--------------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
   target:addStatusEffect(EFFECT_KLIMAFORM,0,0,180);
   return EFFECT_KLIMAFORM;
end;
