---------------------------------------------------------------------------------------------------
-- func: @cleardaggers
-- auth: Melfie
-- desc: Remove augmented daggers from Bazaar
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
   player:query( string.format( "UPDATE char_inventory SET bazaar=0 WHERE charid=%d and itemID=16450", player:getID() ) );
   player:PrintToPlayer( "Daggers removed from your bazaar, please zone for it to take effect.", 0xE );
end;
