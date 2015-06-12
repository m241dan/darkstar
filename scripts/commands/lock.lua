---------------------------------------------------------------------------------------------------
-- func: @lock
-- auth: Davenge
-- desc: Stun Locks the target permanently
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    local targ = player:fetchTargetsID();
    local mob = GetMobByID( targ );
    if( mob:hasStatusEffect( EFFECT_STUN ) ) then
       mob:delStatusEffect( EFFECT_STUN );
    else
       mob:addStatusEffect(EFFECT_STUN,1,0,360)
    end
end;
