---------------------------------------------------------------------------------------------------
-- func: @getmod
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

package.loaded["scripts/globals/melfaugments"] = nil;
require("scripts/globals/melfaugments");

cmdprops =
{
    permission = 1,
    parameters = "s"
};

npc_id = { ["skahnowa"] = 17301590, ["eraser"] = 17310106 };

function onTrigger(player, mobname)
   local npc = GetNPCByID(npc_id[mobname]);
   if( npc == nil ) then
      player:PrintToPlayer( "Bad Mob name passed.", 0xE );
      return;
   end

   player:setVar( string.format( "%dItemTraded", npc:getID() ), 14644 );
   player:setVar( string.format( "%dNumAugs", npc:getID() ), 4 );
   player:setVar( string.format( "%dItemType", npc:getID() ), 1 );

   onFieldParchmentTrigger(npc, player);
end;
