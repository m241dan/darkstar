-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/melfnm");
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
   DeterMob( 17408018, true )
   mob:addMod( MOD_MDEF, 25 );
end;

function onMobFight(mob, target)
    local battletime = mob:getBattleTime();
    local twohourTime = mob:getLocalVar("twohourTime");

    if (twohourTime == 0) then
        mob:setLocalVar("twohourTime",math.random(30,90));
    end
    if (battletime >= twohourTime) then
        mob:useMobAbility(700);
        -- technically aerial hurricane wing, but I'm using 700 for his two hour
        --(since I have no inclination to spend millions on a PI to cap one name you never see)
        mob:setLocalVar("twohourTime",battletime + math.random(60,120));
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    killer:addTitle(NIDHOGG_SLAYER);

    -- Set Nidhogg's Window Open Time
    local wait = 72 * 3600
    local Fafnir = 17408018;
    SetServerVariable("[POP]Nidhogg", os.time(t) + wait); -- 3 days
    SetServerVariable("[PH]Nidhogg", 0);
    SetServerVariable("[WindowOpen]Nidhogg", os.time(t) + ( 21 * 3600 ) );
    onHNMInit( "Nidhogg", Fafnir, mob:getID() )
end;
