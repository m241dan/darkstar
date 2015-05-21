-----------------------------------------
-- Spell: Blizzard
-- Deals ice damage to an enemy.
-----------------------------------------

package.loaded["scripts/globals/magic"] = nil;
require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	--doElementalNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	local dmg = doElementalNuke(46,1,caster,spell,target,false,1.0);
	return dmg;
end;
