-----------------------------------
-- Area: Rulude Gardens
-- NPC:  Trail Markings
-- Dynamis-Jeuno Enter
-- @pos 35 9 -51 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--   player:PrintToPlayer( "Dynamis Jeuno is disabled until further notice.", 0xE );
	if (player:getVar("Dynamis_Status") == 1) then
		player:startEvent(0x2720); -- cs with Cornelia
	elseif (player:getVar("DynaJeuno_Win") == 1) then
		player:startEvent(0x272a,HYDRA_CORPS_TACTICAL_MAP); -- Win CS
	elseif (player:hasKeyItem(VIAL_OF_SHROUDED_SAND)) then
		local firstDyna = 0;
		local realDay = os.time();

                if( player:getVar( "FirstNewDyna" ) == 0 ) then
                   player:setVar( "FirstNewDyna", 1 );
                   player:setVar( "DynamisEntries", 1 );
                end
		
		if (checkFirstDyna(player,4)) then  -- First Dyna-Jeuno => CS
			firstDyna = 1; 
		end
		
		if (player:getMainLvl() < DYNA_LEVEL_MIN) then
			player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
		elseif( player:getVar( "DynamisEntries" ) > 0 or player:getVar("DynamisID") == GetServerVariable("[DynaJeuno]UniqueID")) then
			player:startEvent(0x271c,4,firstDyna,0,BETWEEN_2DYNA_WAIT_TIME,64,VIAL_OF_SHROUDED_SAND,4236,4237);
		else
                   player:PrintToPlayer( "You have no more Dynamis Entires left.", 0xE );
		end
	else
		player:messageSpecial(UNUSUAL_ARRANGEMENT_LEAVES);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("finishRESULT: %u",option);
    
    if (csid == 0x2720) then
        player:addKeyItem(VIAL_OF_SHROUDED_SAND);
        player:messageSpecial(KEYITEM_OBTAINED,VIAL_OF_SHROUDED_SAND);
        player:setVar("Dynamis_Status",0);
    elseif (csid == 0x272a) then
        player:setVar("DynaJeuno_Win",0);
    elseif (csid == 0x271c and option == 0) then
        if (checkFirstDyna(player,4)) then
            player:setVar("Dynamis_Status",player:getVar("Dynamis_Status") + 16);
        end
        
        player:setPos(48.930,10.002,-71.032,195,0xBC);
    end
    
end;
