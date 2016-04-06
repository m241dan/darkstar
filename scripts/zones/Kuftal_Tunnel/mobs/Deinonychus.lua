-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Deinonychus
-- Note: Place Holder for Yowie
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    checkGoVregime(ally,mob,740,1);

    local mobID = mob:getID();
    if (Yowie_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Yowie");
        if (ToD <= os.time(t) and GetMobAction(Yowie) == 0) then
<<<<<<< HEAD
            if (math.random((1),(5)) == 5) then
=======
            if (math.random(1,20) == 5) then
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
                UpdateNMSpawnPoint(Yowie);
                GetMobByID(Yowie):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Yowie", mobID);
                DeterMob(mobID, true);
            end
        end
    end
end;
