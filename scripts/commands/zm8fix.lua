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
       if(targ:getCurrentMission(ZILART) == RETURN_TO_DELKFUTTS_TOWER) then
           targ:completeMission(ZILART,RETURN_TO_DELKFUTTS_TOWER);
           targ:addMission(ZILART,ROMAEVE);
           targ:setVar("ZilartStatus",0);
           player:PrintToPlayer( "ZM8 Fixed for target.", 0xE );
       end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end


