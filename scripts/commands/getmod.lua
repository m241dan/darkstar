---------------------------------------------------------------------------------------------------
-- func: @getmod
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
   if( player:hasStatusEffect( EFFECT_TOWNMOVE ) ) then player:PrintToPlayer( "You have town move.", 0xE ); end
end;
