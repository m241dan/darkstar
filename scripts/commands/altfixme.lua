---------------------------------------------------------------------------------------------------
-- func: setplayervar
-- desc: Sets a variable on the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player, target)
   if( player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus") == 0 ) then
      player:setVar("PromathiaStatus",1);
      return;
   end
   player:PrintToPlayer( "Come on, don't cheat Rag.", 0xE );
end


