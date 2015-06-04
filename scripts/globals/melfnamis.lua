-- Melfnamis written by Melfie

orig_jobs = {
   [15072] = 861,
   [15073] = 862,
   [15074] = 863,
   [15075] = 864,
   [15076] = 865,
   [15077] = 866,
   [15078] = 867,
   [15079] = 868,
   [15080] = 869,
   [15081] = 870,
   [15082] = 871,
   [15083] = 872,
   [15084] = 873,
   [15085] = 874,
   [15086] = 875
};

new_jobs = {
   [16346] = 1054, [11295] = 1055, [11298] = 1056, [11305] = 1057, [11307] = 1058,
   [11292] = 1054, [11385] = 1055, [11388] = 1056, [11478] = 1057, [11398] = 1058,
   [11382] = 1054, [11468] = 1055, [11471] = 1056, [11396] = 1057, [11480] = 1058,
   [11465] = 1054, [15028] = 1055, [15031] = 1056, [15038] = 1057, [15040] = 1058,
   [15025] = 1054, [16349] = 1055, [16352] = 1056, [16360] = 1057, [16362] = 1058
};

nyzul_eq = {
   16108, 15735, 14985, 14570, 15649, -- goliard
   15647, 15733, 14568, 14983, 16106, -- askar
   16107, 15734, 14569, 15648, 14984  -- Denali
};

craft_mats = { 1313, 901, 836, 747, 722, 1311, 658, 1312 };

single_coins = { 1449, 1452, 1455 };

hundred_coins = { 1450, 1453, 1456 };

function onDynaDrop( zone, itemID )
   local tempkey, keyitem, count;
   local players = zone:getPlayers();

   if( itemID > 29325 or itemID < 0 ) then
      return 0;
   elseif( itemID >= 1449 and itemID <= 1457 ) then        --coins
      return itemID;
   elseif( itemID >= 15072 and itemID <= 15146 ) then  --orig_job
      -- find its key item
      tempID = itemID;
      for a=0, 15, 1 do
         keyitem = orig_jobs[tempID];
         if( keyitem ~= nil ) then
            break;
         else
            tempID = tempID -15;
         end
      end
      if( keyitem == nil ) then return false; end
      -- now check all the players
      for _, player in pairs(players) do
         if( player:hasItem( itemID ) == false and player:hasKeyItem( keyitem ) == false ) then return itemID; end
      end
   else						       --new_jobs
      keyitem = new_jobs[itemID];
      for _, player in pairs(players) do
         if( keyitem == nil ) then return itemID end;
         if( player:hasItem( itemID ) == false and player:hasKeyItem( keyitem ) == false ) then return itemID; end
      end
   end

   -- doll out the rewards, because we haven't returned before now
   count = 0;

   for _, player in pairs(players) do
      count = count + 1;
   end

   roll = math.random(1, 100);
   if( count > 10 ) then roll = roll - 2; end

   if( roll >= 1 and roll <= 30 ) then
      for _, player in pairs(players) do 
         player:PrintToPlayer( "Melfnamus Tier 1 Reward: 1k gil and 1k exp", 0xE );
         player:addGil( 1000 );
         player:addExp( 500 );
      end
   elseif( roll >= 31 and roll <= 55 ) then
      for _, player in pairs(players) do
         player:PrintToPlayer( "Melfnamus Tier 2 Reward: 5 coins", 0xE );
         player:addItem( single_coins[math.random(1,3)], 5 );
      end
   elseif( roll >= 56 and roll <= 70 ) then
      for _, player in pairs(players) do
         player:PrintToPlayer( "Melfnamus Tier 3 Reward: 1 Aug Buy", 0xE );
         player:setVar( "AugBuys", ( player:getVar( "AugBuys" ) + 1 ) );
      end
   elseif( roll >= 71 and roll <= 85 ) then
      for _, player in pairs(players) do
         player:PrintToPlayer( "Melfnamus Tier 4 Reward: Nyzul Isle Equip", 0xE );
      end
      return nyzul_eq[math.random(1,#nyzul_eq)];
   elseif( roll >= 86 and roll <= 95 ) then
      for _, player in pairs(players) do
         player:PrintToPlayer( "Melfnamus Tier 4 Reward: Crafting Material", 0xE );
      end
      return craft_mats[math.random(1,#craft_mats)];
   else
      for _, player in pairs(players) do
         player:PrintToPlayer( "Melfnamus Tier 6: 1 One Hundred Coin", 0xE );
         player:addItem( hundred_coins[math.random(1,3)] );
      end
   end
   return 0;
end
