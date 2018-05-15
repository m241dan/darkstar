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
        if (targ:getCurrentMission(ZILART) == THROUGH_THE_QUICKSAND_CAVES) then
            targ:completeMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
            targ:addMission(ZILART,THE_CHAMBER_OF_ORACLES);
            targ:setPos( 200, -2, 32, 168 );
            player:PrintToPlayer( string.format( "Zm6 Fixed for %s", targ:getName() ) );
            return;       
        end
        player:PrintToPlayer( "Player not on the proper Zilart misison." );
        return;
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end


