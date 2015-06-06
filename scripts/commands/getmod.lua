---------------------------------------------------------------------------------------------------
-- func: @getmod
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
   player:PrintToPlayer( string.format( "You have %d Ikishoten", player:getMerit(MERIT_IKISHOTEN) ) );
end;
