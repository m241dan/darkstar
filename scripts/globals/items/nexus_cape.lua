-----------------------------------------
-- ID: 11538
-- Item: Nexus Cape
-- Enchantment: "Teleport" (Party Leader)
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/teleports");
require("scripts/globals/missions");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
<<<<<<< HEAD
   local leader = target:getPartyLeader();
   local leaderRegion = GetPlayerByName( leader ):getZone():getRegionID();
   local ZilartProgress = target:getCurrentMission(ZILART)

   -- sky check
   if( leaderRegion == 16 or leaderRegion == 23 ) then
      if( ZilartProgress < THE_GATE_OF_THE_GODS or ZilartProgress == 255 ) then
         return 56;
      end
   end

   if( leaderRegion >= 24 and leaderRegion <= 27 ) then
      return 56;
   end
   
   if (leader == nil) then
      return 56; -- Not in a party, fail.
   elseif (target:getID() == GetPlayerByName(leader):getID()) then
      return 56; -- User is leader, fail.
   end

   return 0; -- All good, teleporting!
=======
    local result = 56; -- Default is fail.
    local leader = target:getPartyLeader();
    -- In a party and we were able to find the leader
    -- (currently fails in cross map server situations)
    if (leader ~= nil) then
        -- Don't try to teleport to self!
        if (target:getID() ~= leader:getID()) then
            local leaderZone = leader:getZoneID();
            local validZoneList =
            {
                005,007,100,101,102,103,104,105,106,107,108,110,111,112,113,114,
                115,116,117,118,119,120,123,124,126,127,128,230,231,232,234,235,
                236,238,239,240,241,243,244,245,246,247,248,249,250,252,257
            }
            -- Make sure we can actually tele to that zone..
            for _, validZone in ipairs(validZoneList) do
                if (validZone == leaderZone) then
                    result = 0;
                end
            end
        end
    end

    return result;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_TO_LEADER,0,1);
end;
