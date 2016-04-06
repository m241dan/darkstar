-----------------------------------
-- Area: RuAun Gardens
--  MOB: Groundskeeper
-- Note: Place holder Despot
-----------------------------------

require("scripts/zones/RuAun_Gardens/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,143,2);
    checkRegime(ally,mob,144,1);

    -- Get Groundskeeper ID and check if it is a PH of Despot
    local mobID = mob:getID();

    -- Check if Groundskeeper is within the Despot_PH table
    if (Despot_PH[mobID] ~= nil) then
        -- printf("%u is a PH",mobID);
        -- Get Despot previous ToD
        local Despot_ToD = GetServerVariable("[POP]Despot");

        -- Check if Despot window is open, and there is not an Despot popped already(ACTION_NONE = 0)
        if (Despot_ToD <= os.time(t) and GetMobAction(Despot) == 0) then

            -- printf("Despot window open");
            -- Give Groundskeeper 10 percent chance to pop Despot
            if (math.random(1,10) == 5) then
                -- printf("Despot will pop");
<<<<<<< HEAD
                desp = SpawnMob(Despot);
                desp:setPos( killer:getXPos()+2, killer:getYPos(), killer:getZPos()+2 );                
                desp:updateClaim(killer);
=======
                GetMobByID(Despot):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Despot", mobID);
                DeterMob(mobID, true);
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
            end
        end
    end
end;
