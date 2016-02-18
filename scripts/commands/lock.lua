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
    local targ = player:getCursorTarget();
    if( targ:hasStatusEffect( EFFECT_STUN ) ) then
       player:PrintToPlayer( "Your target is no longer locked", 0xE );
       targ:delStatusEffect( EFFECT_STUN );
    else
       player:PrintToPlayer( "Your target is locked for 5 minutes", 0xE );
       targ:addStatusEffect(EFFECT_STUN,1,0,360)
    end
end;
