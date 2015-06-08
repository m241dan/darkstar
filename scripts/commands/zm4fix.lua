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
       targ:delKeyItem(SACRIFICIAL_CHAMBER_KEY);
       targ:addKeyItem(DARK_FRAGMENT);
       targ:messageSpecial(KEYITEM_OBTAINED,DARK_FRAGMENT);
       targ:completeMission(ZILART,THE_TEMPLE_OF_UGGALEPIH);
       targ:addMission(ZILART,HEADSTONE_PILGRIMAGE);
       player:PrintToPlayer( string.format( "Zm4 Fixed for %s", targ:getName() ) );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end


