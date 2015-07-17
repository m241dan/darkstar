-----------------------------------------
-- ID: 11538
-- Item: Nexus Cape
-- Enchantment: "Teleport" (Party Leader)
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/teleports");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local leader = target:getPartyLeader();

    if (leader == nil) then
        return 56; -- Not in a party, fail.
    elseif (target:getID() == GetPlayerByName(leader):getID()) then
        return 56; -- User is leader, fail.
    end

    return 0; -- All good, teleporting!
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_TO_LEADER,0,1);
end;
