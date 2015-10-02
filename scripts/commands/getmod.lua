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

    player:PrintToPlayer( string.format( "Lightning Res = %d and Lightning Def = %d",  mob:getMod( MOD_THUNDERRES ), mob:getMod( MOD_THUNDERDEF ) ) );
end;
