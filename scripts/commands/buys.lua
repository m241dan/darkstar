cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
   player:PrintToPlayer( "Available Buys:", 0xE );
   if( player:getVar( "RelicBuys" ) == -1 ) then
      buys = 0;
   else
      buys = 1;
   end 
   player:PrintToPlayer( string.format( " - Relic Buys: %d", buys ), 0xE );
   player:PrintToPlayer( string.format( " -  Aug Buys: %d", player:getVar( "AugBuys" ) ), 0xE );
end;

