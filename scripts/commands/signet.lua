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
   player:delStatusEffect( EFFECT_SANCTION );
   player:addStatusEffect( EFFECT_SIGNET, 0, 0, ( 9 * 3600 ) );
end;
