-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Jeanvirgaud
-- Outpost Teleporter NPC
-- @pos 45.559 -0.199 26.300 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/conquest");
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/missions");
guardnation = SANDORIA;
csid 		= 0x02cc;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   local ZilartProgress = player:getCurrentMission(ZILART);
   local ZVar = player:getVar("ZilartStatus");

   if( trade:getItemCount() == 1 and trade:getGil() == 1500 ) then
      if( ZilartProgress >= THE_GATE_OF_THE_GODS and ZilartProgress ~= 255 ) then
         player:tradeComplete();
         player:setPos( -12, -54, -597, 214, 0x82 );
      else
         player:PrintToPlayer( "You have not completed enough Zilart to warp to sky.", 0xE );
      end
   end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(guardnation == player:getNation()) then
		player:startEvent(csid,0,0,0,0,0,0,player:getMainLvl(),1073741823 - player:getNationTeleport(guardnation));
	else
		player:startEvent(csid,0,0,0,0,0,1,0,0);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	loca = option - 1073741829;
	player:updateEvent(player:getGil(),OP_TeleFee(player,loca),player:getCP(),OP_TeleFee(player,loca),player:getCP());

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
	if(option >= 5 and option <= 23) then
		if (player:delGil(OP_TeleFee(player,option-5))) then
			toOutpost(player,option);
        	end
        elseif(option >= 1029 and option <= 1047) then
        	local cpCost = OP_TeleFee(player,option-1029);
        	--printf("CP Cost: %u",cpCost);
		if (player:getCP()>=cpCost) then
			player:delCP(cpCost);
			toOutpost(player,option-1024);
        	end        
	end
end;
