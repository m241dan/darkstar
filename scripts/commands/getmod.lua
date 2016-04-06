---------------------------------------------------------------------------------------------------
-- func: @getmod
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

sqlhandle = require( "mysql" )

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
printf( "PLayer name " .. player:getName() );
   player:PrintToPlayer( "Spell interrupt" .. player:getMod(MOD_SPELLINTERRUPT), 0xE );
end;
