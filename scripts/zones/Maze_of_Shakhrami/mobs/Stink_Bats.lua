-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Stink Bats
-----------------------------------

package.loaded["scripts/globals/groundsofvalor"] = nil;
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,695,2);
end;
