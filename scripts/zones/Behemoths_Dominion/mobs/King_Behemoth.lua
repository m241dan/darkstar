-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: King Behemoth
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/melfnm");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 60);
end;


function onMobEngaged(mob,target)
   mob:addMod(MOD_SLEEPRES, 1000);
   mob:addMod(MOD_SILENCERES,100);
   mob:addMod(MOD_STUNRES,100);
   mob:addMod(MOD_BINDRES,50);
   mob:setMobMod(MOBMOD_DRAW_IN,100);
   mob:setMod( MOD_REGAIN, 40 );
   mob:speed( 50 );
   mob:addMod( MOD_INT, 20 );
   mob:setMod( MOD_REGEN, 65 );
   mob:addMod( MOD_MDEF, 100 );
   mob:addMod( MOD_MEVA, 150 );
end;

function onMobFight(mob, target)
end;

function onMobSpawn( mob )
   DeterMob( 17297440, true );
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    ally:addTitle(BEHEMOTH_DETHRONER);

    -- Set King_Behemoth's Window Open Time
    if (LandKingSystem_HQ ~= 1) then
        local wait = 72 * 3600;
        SetServerVariable("[POP]King_Behemoth", os.time(t) + wait); -- 3 days
        if (LandKingSystem_HQ == 0) then -- Is time spawn only
            DeterMob(mob:getID(), true);
        end
    end

    -- Set Behemoth's spawnpoint and respawn time (21-24 hours)
    if (LandKingSystem_NQ ~= 1) then
        SetServerVariable("[PH]King_Behemoth", 0);
        local Behemoth = mob:getID()-1;
        DeterMob(Behemoth, false);
        UpdateNMSpawnPoint(Behemoth);
        GetMobByID(Behemoth):setRespawnTime(math.random(75600,86400));
    endend;

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then
        spell:setAoE(SPELLAOE_RADIAL);
        spell:setFlag(SPELLFLAG_HIT_ALL);
        spell:setRadius(30);
        spell:setAnimation(280);
        spell:setMPCost(1);
    end
end;
