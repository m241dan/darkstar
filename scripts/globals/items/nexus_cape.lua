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
   local leader = target:getPartyLeader();
   local leaderRegion = leader:getZone():getRegionID();
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
   elseif (target:getID() == leader:getID()) then
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
