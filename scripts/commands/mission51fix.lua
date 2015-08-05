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
       targ:addKeyItem(BURNT_SEAL);
       targ:messageSpecial(KEYITEM_OBTAINED,BURNT_SEAL);
       targ:setVar("MissionStatus",12);
       targ:delKeyItem(NEW_FEIYIN_SEAL);
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end


