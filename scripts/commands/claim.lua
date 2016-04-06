---------------------------------------------------------------------------------------------------
-- func: @ah
-- auth: TeoTwawki, Tagban, probably others independently as well.
-- desc: opens the Auction House menu anywhere in the world just to see if we can
---------------------------------------------------------------------------------------------------

package.loaded["scripts/globals/level_incentive"] = nil;
require( "scripts/globals/level_incentive" );

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player,npc)
   handleLevelIncentive( player, true );
end;
