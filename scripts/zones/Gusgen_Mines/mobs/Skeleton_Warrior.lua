-----------------------------------
-- Area: Gusgen Mines
--  MOB: Skeleton Warrior
-----------------------------------

package.loaded["scripts/globals/groundsofvalor"] = nil;
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,679,1);
    checkGoVregime(ally,mob,680,2);
end;
