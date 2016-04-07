-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Trail Markings
-- Dynamis-Beaucedine Enter
-- @pos -284 -39 -422 111
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/Beaucedine_Glacier/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getVar("DynaBeaucedine_Win") == 1) then
		player:startEvent(0x0086,HYDRA_CORPS_INSIGNIA); -- Win CS
        elseif(player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
                if( player:getVar( "FirstNewDyna" ) == 0 ) then
                   player:setVar( "FirstNewDyna", 1 );
                   player:setVar( "DynamisEntries", 1 );
                end
		
		if(checkFirstDyna(player,5)) then  -- First Dyna-Bastok => CS
			firstDyna = 1; 
		end
		
		if(player:getMainLvl() < DYNA_LEVEL_MIN) then
			player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
		elseif( player:getVar( "DynamisEntries" ) > 0 or player:getVar("DynamisID") == GetServerVariable("[DynaBeaucedine]UniqueID")) then
			player:startEvent(0x0077,5,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,VIAL_OF_SHROUDED_SAND,4236,4237);
		else
                   player:PrintToPlayer( "You have no more Dynamis Entires left.", 0xE );
		end
	else
           player:PrintToPlayer( "You missing something...", 0xE );
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("finishRESULT: %u",option);
	
	if(csid == 0x0086) then
		player:setVar("DynaBeaucedine_Win",0);
	elseif(csid == 0x0077 and option == 0) then
		if(checkFirstDyna(player,5)) then
			player:setVar("Dynamis_Status",player:getVar("Dynamis_Status") + 8);
		end
		
		player:setPos(-284.751,-39.923,-422.948,235,0x86);
	end
	
end;
