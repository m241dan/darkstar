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
   player:PrintToPlayer( "Crit Dmg is " .. player:getMod(MOD_CRIT_DMG_INCREASE), 0xE );
end;
