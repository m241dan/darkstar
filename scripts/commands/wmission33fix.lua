---------------------------------------------------------------------------------------------------
-- func: setplayervar
-- desc: Sets a variable on the target player.
---------------------------------------------------------------------------------------------------
require( "scripts/globals/missions" )

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        player:PrintToPlayer("You must enter a valid target name and variable name.");
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
       targ:setRank( 4 );
       targ:completeMission( 2, 12 );
       targ:setVar( "MissionStatus", 0 );
       targ:addGil( 5000 );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end



