---------------------------------------------------------------------------------------------------
-- func: @entries
-- desc: Tells a player how many dynamis entries they have
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
   entries = player:getVar( "DynamisEntries" );
   player:PrintToPlayer( string.format( "You have %d Dynamis Entries.", entries ), 0xE );
end;
