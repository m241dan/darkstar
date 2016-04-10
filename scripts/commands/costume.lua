---------------------------------------------------------------------------------------------------
-- func: costume
-- desc: Sets the players current costume.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, costume, type)
    if( not type or type == 1 ) then
       player:costume( costume );
    elseif( type == 2) then
       player:costume2( costume );
    else
       player:PrintToPlayer( "Bad type passed: @costume cid, type." );
    end
end
