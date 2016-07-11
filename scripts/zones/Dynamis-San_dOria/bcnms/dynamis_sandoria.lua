-----------------------------------
-- Area: Dynamis San d'Oria
-- Name: Dynamis San d'Oria
-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
    
    SetServerVariable("[DynaSandoria]UniqueID",player:getDynamisUniqueID(1281));
    SetServerVariable("[DynaSandoria]Boss_Trigger",0);
    SetServerVariable("[DynaSandoria]Already_Received",0);
    
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
   if( player:getVar( "DynamisID" ) ~= GetServerVariable( "[DynaSandoria]UniqueID" ) ) then
      player:setVar( "DynamisID", GetServerVariable("[DynaSandoria]UniqueID" ) );
      player:addVar( "DynamisEntries", -1 );
   end
   local relicid = player:getVar( "RelicID" );
   local dynaid = player:getVar( "DynamisID" );

   printf( relicid )
   printf( dynaid )

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
		GetNPCByID(17535224):setStatus(2);
		SetServerVariable("[DynaSandoria]UniqueID",0);
	end
	
end;
