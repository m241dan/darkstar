require( "scripts/globals/status" )

cmdprops =
{
    permission = 0,
    parameters = ""
};


function onTrigger(player)
   player:PrintToPlayer( "Blm Ice Potency Merit is: " ..  player:getMerit(MERIT_ICE_MAGIC_POTENCY), 0xE );
end;
