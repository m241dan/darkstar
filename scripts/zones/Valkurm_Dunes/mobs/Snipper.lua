-----------------------------------	
-- Area: Valkurm Dunes	
-- MOB:  Snipper	
-----------------------------------

package.loaded["/scripts/globals/fieldsofvalor"] = nil;
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,8,1);
	checkRegime(killer,mob,9,2);
end;	
