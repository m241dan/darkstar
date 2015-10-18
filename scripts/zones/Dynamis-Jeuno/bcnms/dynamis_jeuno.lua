-----------------------------------
-- Area: Dynamis Jeuno
-- Name: Dynamis Jeuno
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    
    SetServerVariable("[DynaJeuno]UniqueID",player:getDynamisUniqueID(1283));
    SetServerVariable("[DynaJeuno]Boss_Trigger",0);
    SetServerVariable("[DynaJeuno]Already_Received",0);
    
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
   if( player:getVar("DynamisID") ~= GetServerVariable("[DynaJeuno]UniqueID") ) then
      player:setVar("DynamisID",GetServerVariable("[DynaJeuno]UniqueID"));
      player:addVar("DynamisEntries", -1 );
   end
   local relicid = player:getVar( "RelicID" );
   local dynaid = player:getVar( "DynamisID" );

   if( relicid == dynaid or relicid == -2 ) then
      if( player:getFreeSlotsCount() <= 0 ) then
         player:PrintToPlayer( "Your inventory is full. Clear it and rezone.", 0xE );
         return;
      end
      player:addItem( player:getVar( "RelicBought" ) );
      player:messageSpecial( ITEM_OBTAINED, player:getVar( "RelicBought" ) );
      if( relicid == -2 ) then player:setVar( "RelicBuys", -1 ); end
      player:setVar( "RelicID", dynaid );
   end
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,instance,leavecode)
--print("leave code "..leavecode);
	if(leavecode == 4) then
		GetNPCByID(17547510):setStatus(2);
		SetServerVariable("[DynaJeuno]UniqueID",0);
	end
	
end;
