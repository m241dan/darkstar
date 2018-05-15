---------------------------------------------------------------------------------------------------
-- func: @lock
-- auth: Davenge
-- desc: Stun Locks the target permanently
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    local targ = player:getCursorTarget();
    player:PrintToPlayer( "Allegiance = " .. targ:getAllegiance(), 0xE );
end;
