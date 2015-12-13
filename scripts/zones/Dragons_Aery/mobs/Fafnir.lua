-----------------------------------
-- Area: Dragons Aery
--  HNM: Fafnir
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
   local ToD   = GetServerVariable("[POP]Nidhogg");
   local kills = GetServerVariable("[PH]Nidhogg");


   DeterMob( 17408019, true );
   if( ToD <= os.time(t) ) then
      SetServerVariable( "[PH]Nidhogg", kills + 1 );
   end
   mob:addMod( MOD_SLEEPRES, 20 );
   mob:addMod( MOD_MDEF, 20 );
end;

function onMobFight( mob, target )
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    ally:addTitle(FAFNIR_SLAYER);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
   local Fafnir  = mob:getID();
   local Nidhogg = 17408019;

   SetServerVariable( "[WindowOpen]Nidhogg", os.time(t) + ( 21 * 3600 ) );
   onHNMInit( "Nidhogg", Fafnir, Nidhogg );
end;
