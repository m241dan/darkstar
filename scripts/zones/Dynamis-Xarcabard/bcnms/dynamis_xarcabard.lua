-----------------------------------
-- Area: Dynamis Xarcabard
-- Name: Dynamis Xarcabard
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    
    SetServerVariable("[DynaXarcabard]UniqueID",player:getDynamisUniqueID(1285));
    SetServerVariable("[DynaXarcabard]TE150_Trigger",0);
    SetServerVariable("[DynaXarcabard]Boss_Trigger",0);
    
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
   if( player:getVar("DynamisID") ~= GetServerVariable("[DynaXarcabard]UniqueID") ) then
      player:setVar("DynamisID",GetServerVariable("[DynaXarcabard]UniqueID"));
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
           if( player ~= nil ) then player:setPos(569.312,-0.098,-270.158,90,0x70); end
	   GetNPCByID(17330778):setStatus(2);
	   SetServerVariable("[DynaXarcabard]UniqueID",0);
	end
	
end;
