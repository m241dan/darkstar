---------------------------------------------------------------------------------------------------
-- func: @lock
-- auth: Davenge
-- desc: Stun Locks the target permanently
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player,ally)
    if( player:getName() ~= "Melfie" ) then
       return;
    end

    local targ = player:getCursorTarget();
    targ:setAllegiance(ally)
    player:PrintToPlayer( "Allegiance set.", 0xE );
end;
