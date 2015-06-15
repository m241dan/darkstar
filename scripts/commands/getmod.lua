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
    local targ = player:fetchTargetsID();
    if( targ == nil ) then return; end

    mob = GetMobByID(targ);
    if( mob == nil ) then return; end

    player:PrintToPlayer( string.format( "%s's water def %d and water res %d", mob:getName(), mob:getMod( MOD_DARKDEF ), mob:getMod( MOD_DARKRES ) ), 0xE);
end;
