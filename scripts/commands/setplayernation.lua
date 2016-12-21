---------------------------------------------------------------------------------------------------
-- func: setplayernation
-- desc: Sets the target players nation.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sii"
};

function onTrigger(player, target, nation, rank)
    
    nation = tonumber(nation) or _G[nation];
    
    if (target == nil) then
        target = player:getName();
    end

    if (nation > 2 or nation < 0) then
        player:PrintToPlayer( "Invalid nation id given! Must be 0, 1, or 2!" );
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:setNation( nation );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end

    if( rank > 0 ) then
       player:setRank( rank );
    end

end;
