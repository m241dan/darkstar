require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/zone");

function onHNMInit( keystring, NQ, HQ )
   local HQToD  = GetServerVariable( string.format( "[POP]%s", keystring ) );
   local kills  = GetServerVariable( string.format( "[PH]%s", keystring ) );
   local windowOpen = GetServerVariable( string.format( "[WindowOpen]%s", keystring ) );
   local respawnAt = windowOpen - os.time(t);
   local mobToSpawn = NQ;

   if( respawnAt < 900 ) then
      respawnAt = 900;
   end

   DeterMob(NQ, true );
   DeterMob(HQ, true );

   if( HQToD <= os.time(t) and GetMobAction(HQ) == 0 ) then
      if( math.random((1),(5)) == 3 or kills > 6 ) then
         mobToSpawn = HQ; 
      end
   end

   UpdateNMSpawnPoint(mobToSpawn);
   GetMobByID(mobToSpawn):setRespawnTime(math.random(respawnAt, respawnAt + (3 * 3600) ) );
end;
