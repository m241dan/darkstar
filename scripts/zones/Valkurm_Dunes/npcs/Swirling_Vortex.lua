-----------------------------------
--  Area: Valkurm Dunes
--  NPC:  Swirling Vortex
--  Entrance to Lufaise Meadows
--	@pos 420.057 0.000 -199.905 103 
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/zones/Valkurm_Dunes/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
   local ZilartProgress = player:getCurrentMission(ZILART);
   local ZVar = player:getVar("ZilartStatus");

   if( ZilartProgress >= THE_GATE_OF_THE_GODS and ZilartProgress ~= 255 and player:getVar( "CoPSkip" ) == 0 ) then
      player:completeMission( COP, ANCIENT_FLAMES_BECKON );
      player:completeMission( COP, THE_RITES_OF_LIFE );
      player:completeMission( COP, BELOW_THE_ARKS );
      player:completeMission( COP, THE_MOTHERCRYSTALS );
      player:completeMission( COP, AN_INVITATION_WEST );
      player:completeMission( COP, THE_LOST_CITY );
      player:completeMission( COP, DISTANT_BELIEFS );
      player:completeMission( COP, AN_ETERNAL_MELODY );
      player:completeMission( COP, ANCIENT_VOWS );
      player:completeMission( COP, A_TRANSIENT_DREAM );
      player:completeMission( COP, THE_CALL_OF_THE_WYRMKING );
      player:completeMission( COP, A_VESSEL_WITHOUT_A_CAPTAIN );
      player:completeMission( COP, THE_ROAD_FORKS );
      player:completeMission( COP, DESCENDANTS_OF_A_LINE_LOST );
      player:completeMission( COP, COMEDY_OF_ERRORS_ACT_I );
      player:completeMission( COP, TENDING_AGED_WOUNDS );
      player:completeMission( COP, DARKNESS_NAMED );
      player:completeMission( COP, SHELTERING_DOUBT );
      player:completeMission( COP, THE_SAVAGE );
      player:completeMission( COP, THE_SECRETS_OF_WORSHIP );
      player:completeMission( COP, SLANDEROUS_UTTERINGS );
      player:completeMission( COP, THE_ENDURING_TUMULT_OF_WAR );
      player:completeMission( COP, DESIRES_OF_EMPTINESS );
      player:completeMission( COP, THREE_PATHS );
      player:completeMission( COP, PARTNERS_WITHOUT_FAME );
      player:completeMission( COP, SPIRAL );
      player:completeMission( COP, WHERE_MESSENGERS_GATHER );
      player:completeMission( COP, FLAMES_FOR_THE_DEAD );
      player:completeMission( COP, FOR_WHOM_THE_VERSE_IS_SUNG );
      player:completeMission( COP, A_PLACE_TO_RETURN );
      player:completeMission( COP, MORE_QUESTIONS_THAN_ANSWERS );
      player:completeMission( COP, ONE_TO_BE_FEARED );
      player:completeMission( COP, CHAINS_AND_BONDS );
      player:completeMission( COP, FLAMES_IN_THE_DARKNESS );
      player:completeMission( COP, FIRE_IN_THE_EYES_OF_MEN );
      player:completeMission( COP, CALM_BEFORE_THE_STORM );
      player:completeMission(COP,THE_WARRIOR_S_PATH);
      player:addMission(COP,GARDEN_OF_ANTIQUITY);
      player:setVar( "CoPSkip", 1 );
      player:setVar("PromathiaStatus",1);
      player:addKeyItem(LIGHT_OF_ALTAIEU);
      player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_ALTAIEU);
      player:addTitle(SEEKER_OF_THE_LIGHT);
      player:PrintToPlayer( "You have gained Sea access.", 0xE );
   end

	
	if (player:hasCompletedMission(COP,THE_MOTHERCRYSTALS)) then
		player:startEvent(0x000c);
	else
		player:messageSpecial(AN_EMPTY_LIGHT_SWIRLS);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if (csid == 0x000c and option == 1) then
		toLufaiseMeadows(player);
	end
	
end;
