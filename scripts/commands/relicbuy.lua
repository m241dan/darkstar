

relics = {
	   ["gaxe"] = 18294,
           ["axe"]  = 18288,
           ["bow"]  = 18348,
           ["gun"]  = 18336,
           ["katana"]  = 18312,
           ["gkatana"] = 18318,
           ["h2h"] = 18264,
           ["dagger"] = 18270,
           ["sword"] = 18276,
           ["gsword"] = 18282,
           ["scythe"] = 18306,
           ["polearm"] = 18300,
           ["club"] = 18324,
           ["staff"] = 18330,
           ["horn"] = 18342,
           ["shield"] = 18141
};

dynazones = { 39, 40, 41, 42, 134, 135, 185, 186, 187, 188 };

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player,arg)
   player:PrintToPlayer( "RelicBuys disabled until they are more stable.", 0xE );
   return;
end
--[[
   if( player:getVar( "RelicBuys" ) == 0 ) then player:setVar( "RelicBuys", 1 ); end

   if( arg == nil ) then
      player:PrintToPlayer( "Proper Usage: @relicbuy <relic>", 0xE );
      player:PrintToPlayer( " - gaxe, axe, bow, gun, katana, gkatana, h2h", 0xE );
      player:PrintToPlayer( " - dagger, sword, gsword, scythe, polearm, club", 0xE );
      player:PrintToPlayer( " - staff, horn, shield", 0xE );
      return;
   end

   if( relics[string.lower(arg)] == nil ) then
      player:PrintToPlayer( "Bad relic inputed", 0xE );
      player:PrintToPlayer( " - gaxe, axe, bow, gun, katana, gkatana, h2h", 0xE );
      player:PrintToPlayer( " - dagger, sword, gsword, scythe, polearm, club", 0xE );
      player:PrintToPlayer( " - staff, horn, shield", 0xE );
      return;
   else
      relic_id = relics[string.lower(arg)];
   end

   if( player:getVar( "RelicBuys" ) == -1 ) then
      player:PrintToPlayer( "You have no Relic Buys available.", 0xE );
      return;
   end

   local indyna = false;
   local zoneid = player:getZoneID();
   for _,i in pairs( dynazones ) do
      if( zoneid == i ) then
         indyna = true;
         break;
      end
   end

   player:setVar( "RelicBought", relic_id );
   if( indyna == true ) then
      if( player:getFreeSlotsCount() <= 0 ) then
         player:PrintToPlayer( "Your inventory is full. Clear it and rezone.", 0xE );
         return;
      end
      player:setVar( "RelicID", player:getVar( "DynamisID" ) );
      player:addItem( relic_id );
      player:messageSpecial( ITEM_OBTAINED, relic_id );
      player:setVar( "RelicBuys", -1 );
   else
      player:setVar( "RelicID", -2 );
      player:PrintToPlayer( "Relic set. You will receive upon loading into Dynamis.", 0xE );
   end
end; ]]--
