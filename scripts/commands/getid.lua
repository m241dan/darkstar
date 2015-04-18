---------------------------------------------------------------------------------------------------
-- func: @getid
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    if (player ~= nil) then
        player:PrintToPlayer(string.format("Selected Target's ID is: %u ", targ));
    end
end;
