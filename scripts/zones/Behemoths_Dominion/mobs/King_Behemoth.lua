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
   mob:addMod(MOD_SILENCERES,100);
   mob:addMod(MOD_STUNRES,10);
   mob:addMod(MOD_BINDRES,50);
   mob:setMobMod(MOBMOD_DRAW_IN,100);
   mob:setMod( MOD_REGAIN, 20 );
   mob:speed( 40 );
   mob:setMod( MOD_REGEN, 65 );
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

    if (math.random((1),(100)) <= 4) then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(1936,13566,1000); -- Defending Ring
        SetDropRate(1936,13415,0);
    else
        SetDropRate(1936,13566,0);
        SetDropRate(1936,13415,1000); -- Pixie Earring
    end
    -- Set King_Behemoth's Window Open Time
    local wait = 72 * 3600
    local Behemoth = 17297440;
    SetServerVariable("[POP]King_Behemoth", os.time(t) + wait); -- 3 days
    SetServerVariable("[PH]King_Behemoth", 0);
    SetServerVariable("[WindowOpen]King_Behemoth", os.time(t) + ( 21 * 3600 ) );
    onHNMInit( "King_Behemoth", Behemoth, mob:getID() );
end;

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then
        spell:setAoE(SPELLAOE_RADIAL);
        spell:setFlag(SPELLFLAG_HIT_ALL);
        spell:setRadius(30);
        spell:setAnimation(280);
        spell:setMPCost(1);
    end
end;
