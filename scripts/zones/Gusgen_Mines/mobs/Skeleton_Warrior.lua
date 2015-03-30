-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Skeleton Warrior
-----------------------------------

package.loaded["scripts/globals/groundsofvalor"] = nil;
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,679,1);
   checkGoVregime(killer,mob,680,2);
end;
