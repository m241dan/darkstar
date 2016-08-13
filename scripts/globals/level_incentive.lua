require("scripts/globals/status");
require("scripts/globals/keyitems");

JOB_NON             = 0;
JOB_WAR             = 1;
JOB_MNK             = 2;
JOB_WHM             = 3;
JOB_BLM             = 4;
JOB_RDM             = 5;
JOB_THF             = 6;
JOB_PLD             = 7;
JOB_DRK             = 8;
JOB_BST             = 9;
JOB_BRD             = 10;
JOB_RNG             = 11;
JOB_SAM             = 12;
JOB_NIN             = 13;
JOB_DRG             = 14;
JOB_SMN             = 15;
JOB_BLU             = 16;
JOB_COR             = 17;
JOB_PUP             = 18;
JOB_DNC             = 19;
JOB_SCH             = 20;
JOB_GEO             = 21;
JOB_RUN             = 22;

-- level_incentive lib

mid_tier = {};

-- repeatable, level, itemid, amount

mid_tier[JOB_WAR] = { false, 41, { 15184 }, { 1 } }; --voyager sallet
mid_tier[JOB_MNK] = { true, 10, { 4381 }, { 6 } }; --meat mithkabob
mid_tier[JOB_WHM] = { false, 36, { 4731, 4730, 4732 }, { 1, 1, 1 } }; --telepack
mid_tier[JOB_BLM] = { false, 40, { 4870, 4814 }, { 1, 1 } }; -- warp II and freeze
mid_tier[JOB_RDM] = { false, 41, { 4717, 4714 }, { 1, 1 } }; -- refresh and phalanx
mid_tier[JOB_THF] = { true, 10, { 18148, 18151 }, { 99, 99 } }; -- acid bolt and bloody bolts
mid_tier[JOB_PLD] = { false, 50, { 15506 }, { 1 } }; -- parade gorget
mid_tier[JOB_DRK] = { false, 41, { 4874, 4875 }, { 1, 1 } }; -- absorb str/dex
mid_tier[JOB_BST] = { true, 10, { 17877 }, { 12 } }; -- courier carrie
mid_tier[JOB_BRD] = { false, 4, { 17369, 17375, 17367 }, { 1, 1, 1 } }; -- flute pack
mid_tier[JOB_RNG] = { true, 10, { 17332, 18153 }, { 99, 99 } }; -- fang arrow and holy bolt
mid_tier[JOB_SAM] = { false, 50, { 17813 }, { 1 } }; -- Soboro
mid_tier[JOB_NIN] = { true, 5, { 1179 }, { 99 } }; -- shihei
mid_tier[JOB_DRG] = { false, 38, { 15347 }, { 1 } }; -- volans greaves
mid_tier[JOB_SMN] = { false, 24, { 14062 }, { 1 } }; -- carbuncle mitts
mid_tier[JOB_SCH] = { false, 18, { 6041, 6042, 6043, 6044, 6045, 6046, 6047, 6048 }, { 1, 1, 1, 1, 1, 1, 1, 1 } }; -- helix pack 
mid_tier[JOB_BLU] = { false, 58, { nil }, { nil } }; -- they get their spells
mid_tier[JOB_DNC] = { false, 50, { 14936 }, { 1 } }; -- storm monapolas  
mid_tier[JOB_COR] = { true, 5, { 19228 }, { 99 } }; -- paktong bullets

high_tier = {};

-- level, itemid, amount

high_tier[JOB_WAR] = { 73, { 18491 }, { 1 } }; -- perdu voulge
high_tier[JOB_MNK] = { 73, { 14873 }, { 1 } }; -- bando's
high_tier[JOB_WHM] = { 70, { 15391 }, { 1 } }; -- blessed trousers
high_tier[JOB_BLM] = { 73, { 14420 }, { 1 } }; -- igqira weskit
high_tier[JOB_RDM] = { 64, { 13155 }, { 1 } }; -- enfeebling torque
high_tier[JOB_THF] = { 72, { 18001 }, { 1 } }; -- harpe
high_tier[JOB_PLD] = { 73, { 12387 }, { 1 } }; -- koenig shield
high_tier[JOB_DRK] = { 73, { 18943 }, { 1 } }; -- perdu sickle
high_tier[JOB_BST] = { 70, { 17928 }, { 1 } }; -- juggernaut
high_tier[JOB_BRD] = { 65, { 13161 }, { 1 } }; -- wind torque
high_tier[JOB_RNG] = { 70, { 17939 }, { 1 } }; -- kriegsbeil
high_tier[JOB_SAM] = { 72, { 17829 }, { 1 } }; -- hagun
high_tier[JOB_NIN] = { 70, { 13915 }, { 1 } }; -- ohat
high_tier[JOB_DRG] = { 75, { 18110 }, { 1 } }; -- mezraq
high_tier[JOB_SMN] = { 71, { 14468 }, { 1 } }; -- yinyang robe
high_tier[JOB_SCH] = { 41, { 6049, 6050, 6051, 6052, 6053, 6054, 6055, 6056 }, { 1, 1, 1, 1, 1, 1, 1, 1 } } -- storm pack
high_tier[JOB_BLU] = { 73, { 17741 }, { 1 } }; -- perdu hanger
high_tier[JOB_DNC] = { 72, { 18031 }, { 1 } }; -- Amir Jambiya
high_tier[JOB_COR] = { 72, { 17275 }, { 1 } }; -- Coffinmaker

function handleLevelIncentive( player, command )
   local job = player:getMainJob();
   local lvl = player:getTrueLvl( job );
   local mid_table = mid_tier[job];
   local high_table = high_tier[job];

   if( player:getTotalLvls() - 22 < 15 ) then
      player:PrintToPlayer( "Incentives do not kick in until you've achieved 15 levels.", 0xE );
      return
   end;

   player:PrintToPlayer( "Leveling Incentive:", 0xE );

   if( command == false ) then
      if( player:getVar("FirstIncentiveGain") == 0 ) then
         local total = player:getTotalLvls() - 22;
         player:setVar("FirstIncentiveGain", 1 );
         player:PrintToPlayer( string.format( "You have been retroactively been rewarded %d gil", total * 1000 ), 0xE );
         player:addGil(total*1000);
      else
         player:PrintToPlayer( "You have gained 1000 gil from Leveling Incentives.", 0xE );
         player:addGil(1000);
      end

      -- handle AF
      if( player:getVar( string.format( "LIAF%d", job ) ) == 0 and lvl >= 50 ) then
         player:setVar( string.format( "LIAF%d", job ), 1 );
         player:PrintToPlayer( "Congratulations, you have been awarded your AF, go to a storage NPC to retrieve it.", 0xE );
         if( job >= JOB_BLU ) then
            if( job == JOB_BLU ) then player:addKeyItem( MAGUS_ATTIRE_CLAIM_SLIP ) end
            if( job == JOB_COR ) then player:addKeyItem( CORSAIRS_ATTIRE_CLAIM_SLIP ) end
            if( job == JOB_PUP ) then player:addKeyItem( PUPPETRY_ATTIRE_CLAIM_SLIP ) end
            if( job == JOB_DNC ) then 
               player:addKeyItem( 1967 );
               player:addKeyItem( 1968 );
            end
            if( job == JOB_SCH ) then player:addKeyItem( SCHOLARS_ATTIRE_CLAIM_SLIP ) end
         else
            player:addKeyItem( job + 653 );
         end
      end
   end

   if( player:getFreeSlotsCount() <= 0 ) then
      player:PrintToPlayer( "Your inventory is full, please sort and type @claim.", 0xE );
      return;
   end

   if( lvl == 75 ) then
      local count = player:getSFJobs();
      if( count == 1 ) then
         if( player:getVar( "LIFirst75" ) == 0 ) then
            player:PrintToPlayer( "Congratulations on your first 75! Have a Turban and gil on us.", 0xE );
            player:addGil(100000);
            player:setVar( "LIFirst75", 1 );
            player:addItem( 15270 );
         end
      end
      if( count == 2 ) then
         if( player:getVar( "LISecond75" ) == 0 ) then
            player:PrintToPlayer( "Congratulations on your second 75! Enjoy your Nexus Cape and gil", 0xE );
            player:addGil(500000);
            player:setVar( "LISecond75", 1 );
            player:addItem( 11538 );
         end
      end
      if( count == 3 ) then
         if( player:getVar( "LIThird75" ) == 0 ) then
            player:setVar( "LIThird75", 1 );
            player:PrintToPlayer( "Congratulations on your third 75! Enjoy your gil", 0xE );
            player:addGil(1000000);
         end
      end
      if( count == 4 ) then
         if( player:getVar( "LIFourth75" ) == 0 ) then
            player:PrintToPlayer( "Congratulations on your fourth 75! Enjoy your dynamis curreny.", 0xE );
            player:setVar( "LIFourth75", 1 );
            player:addItem( 1456, 1 );
            player:addItem( 1453, 1 );
            player:addItem( 1450, 1 );         
         end
      end
   end

   -- mid tier rewards

   local m_items = mid_table[3];
   local m_amounts = mid_table[4];
   local m_len = #m_items;


   if( mid_table[1] == true ) then
      if( lvl % mid_table[2] == 0 and command == false ) then
         player:PrintToPlayer( "You have gained your per 5 or 10 level reward.", 0xE );
         for x = 1, m_len, 1 do 
            player:addItem( m_items[x], m_amounts[x] );
         end
      end
   elseif( lvl >= mid_table[2] and player:getVar( string.format( "LIMidTier%d", job) ) == 0 ) then
      player:setVar( string.format( "LIMidTier%d", job ), 1 );
      if( job == JOB_BLU ) then
         player:PrintToPlayer( "You now know: Frightful Roar, Light of Penance and Refueling", 0xE );
         player:addSpell( 530 );
         player:addSpell( 561 );
         player:addSpell( 634 );
      else
         player:PrintToPlayer( "New items have been added to your inventory!", 0xE );
         for x = 1, m_len, 1 do
            player:addItem( m_items[x] );
         end
      end
   end

   -- high tier rewards

   local h_items = high_table[2];
   local h_amounts = high_table[3];
   local h_len = #h_items;
   
   if( lvl >= high_table[1] and player:getVar( string.format( "LIHighTier%d", job ) ) == 0 ) then
      player:setVar( string.format( "LIHighTier%d", job ), 1 );
      player:PrintToPlayer( "New items have been added to your inventory!", 0xE );
      for x = 1, h_len, 1 do
         player:addItem( h_items[x] );
      end
   end
end




