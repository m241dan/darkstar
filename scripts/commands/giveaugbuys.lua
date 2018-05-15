---------------------------------------------------------------------------------------------------
-- func: setplayervar
-- desc: Sets a variable on the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, value)
    if (target == nil or value == nil) then
        player:PrintToPlayer("You must enter a valid target name and amount of augbuys to give.");
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:setVar( "AugBuys", targ:getVar( "AugBuys" ) + value );
        player:PrintToPlayer( string.format( "Gave %s %d AugBuys.", target, value ), 0xE );
        targ:PrintToPlayer( "You have been awareded " .. value .. " AugBuys.", 0xE );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end
