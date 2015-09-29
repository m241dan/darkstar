---------------------------------------------------------------------------------------------------
-- func: setplayervar
-- desc: Sets a variable on the target player.
---------------------------------------------------------------------------------------------------

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
       target:addMission()
       player:PrintToPlayer( string.format( "Zm4 Fixed for %s", targ:getName() ) );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end


