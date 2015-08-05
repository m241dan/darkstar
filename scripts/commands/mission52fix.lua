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
        targ:addMission(ZILART,THE_NEW_FRONTIER);
        targ:addKeyItem(SHADOW_FRAGMENT);
        targ:messageSpecial(KEYITEM_OBTAINED,SHADOW_FRAGMENT);
        targ:setVar("MissionStatus",4);
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end


