---------------------------------------------------------------------------------------------------
-- func: setplayervar
-- desc: Sets a variable on the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        player:PrintToPlayer("You must enter a valid target name and variable name.");
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
       if (targ:hasKeyItem(NEW_FEIYIN_SEAL) and targ:getVar( "MissionStatus" ) == 11 ) then
          targ:addKeyItem(BURNT_SEAL);
          targ:messageSpecial(KEYITEM_OBTAINED,BURNT_SEAL);
          targ:setVar("MissionStatus",12);
          targ:delKeyItem(NEW_FEIYIN_SEAL);
          player:PrintToPlayer( "Player fixed." );
       else
          player:PrintToPlayer( "Player is not ready for this. Does not have Feiyin Seal or is not MissionStatus 11." );
       end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end


