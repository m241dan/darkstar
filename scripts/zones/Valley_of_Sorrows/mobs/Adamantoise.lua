-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Adamantoise
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
   local ToD   = GetServerVariable("[POP]Aspidochelone");
   local kills = GetServerVariable("[PH]Aspidochelone");

   DeterMob( 17301538, true );
   if( ToD <= os.time(t) ) then
      SetServerVariable( "[PH]Aspidochelone", kills + 1 );
   end

end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   killer:addTitle(TORTOISE_TORTURER);
end;

function onMobDespawn(mob)
   local Adamantoise  = mob:getID();
   local Aspidochelone = 17301538;

   SetServerVariable( "[WindowOpen]Aspidochelone", os.time(t) + ( 21 * 3600 ) );
   onHNMInit( "Aspidochelone", Adamantoise, Aspidochelone );
end;
