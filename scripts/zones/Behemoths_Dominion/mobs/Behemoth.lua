-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scrupts/globals/melfnm");
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------
function onMobSpawn(mob)
   local ToD   = GetServerVariable("[POP]King_Behemoth");
   local kills = GetServerVariable("[PH]King_Behemoth");

   if( ToD <= os.time(t) ) then
      SetServerVariable( "[PH]King_Behemoth", kills + 1 );
   end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   local Behemoth      = mob:getID();
   local King_Behemoth = 17297441;

   killer:addTitle(BEHEMOTHS_BANE);
   SetServerVariable( "[WindowOpen]King_Behemoth", os.time(t) + ( 21 * 3600 ) );
   onHNMInit( "King_Behemoth", Behemoth, King_Behemoth );
end;
