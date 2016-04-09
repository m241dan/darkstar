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
   player:delStatusEffect( EFFECT_SIGNET );
   player:addStatusEffect( EFFECT_SANCTION, 0, 0, ( 3 * 3600 ) );
end;
