-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/melfnm");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------
function onMobSpawn(mob)
   local ToD   = GetServerVariable("[POP]King_Behemoth");
   local kills = GetServerVariable("[PH]King_Behemoth");

   DeterMob( 17297441, true );
   if( ToD <= os.time(t) ) then
      SetServerVariable( "[PH]King_Behemoth", kills + 1 );
   end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:addTitle(BEHEMOTHS_BANE);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
   local Behemoth      = mob:getID();
   local King_Behemoth = 17297441;

   SetServerVariable( "[WindowOpen]King_Behemoth", os.time(t) + ( 21 * 3600 ) );
   onHNMInit( "King_Behemoth", Behemoth, King_Behemoth );
end;
