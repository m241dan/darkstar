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

    local angle = mob:getAngle( player );
    angle = mob:getRotPos() - angle
    player:PrintToPlayer( angle, 0xE);
    player:PrintToPlayer( ((40-math.abs(angle))/40), 0xE );
end;
