-----------------------------------
-- Area: Dynamis Beaucedine
-- Name: Dynamis Beaucedine
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    
    SetServerVariable("[DynaBeaucedine]UniqueID",player:getDynamisUniqueID(1284));
    SetServerVariable("[DynaBeaucedine]Already_Received",0);
    
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
   if( player:getVar("DynamisID") ~= GetServerVariable("[DynaBeaucedine]UniqueID") ) then
      player:setVar("DynamisID",GetServerVariable("[DynaBeaucedine]UniqueID"));
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
	if(leavecode == 4) then
           if( player ~= nil ) then player:setPos(-284.751,-39.923,-422.948,235,0x6F); end
	   SetServerVariable("[DynaBeaucedine]UniqueID",0);
	end
	
end;
