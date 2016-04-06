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
   local merits = player:getMerit(MERIT_AVATAR_PHYSICAL_ATTACK);

   player:PrintToPlayer( string.format( "Merit number: %d", merits), 0xE );
end;
