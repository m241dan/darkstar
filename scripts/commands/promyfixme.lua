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
   if( player:hasCompletedMission(COP,THE_WARRIOR_S_PATH) ) then
      player:setVar("PromathiaStatus",1);
      player:addKeyItem(LIGHT_OF_ALTAIEU);
      player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_ALTAIEU);
      player:addTitle(SEEKER_OF_THE_LIGHT);
      return;
   end
   player:PrintToPlayer( "Come on, don't cheat Rag.", 0xE );
end


