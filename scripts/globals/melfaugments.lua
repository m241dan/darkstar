-- Abyssea Augs --
local ITEM_DAGGER = 16450
local augmentable_items = {}

local augment_strings = { 
                    [1] = "HP", [9] = "MP", [31] = "Evasion", [33] = "Defense", [39] = "Enmity", [41] = "Crit Hit Rate", [42] = "Enemy Crit Hit Rate -", [51] = "HP recovered while resting",
                    [52] = "MP recovered while resting", [53] = "Spell Interruption Down", [54] = "Phyiscal Dmg. Taken -", [55] = "Magic Dmg. Taken -", [56] = "Breath Dmg. Taken -", [57] = "Magic Crit Rate",
                    [133] = "Magic Attack Bonus", [137] = "Regen", [138] = "Refresh", [140] = "Fast Cast", [141] = "Conserve MP", [147] = "Treasure Hunter", [148] = "Gilfinder", [153] = "Shield Mastery",
                    [176] = "Resist Sleep", [177] = "Resist Poison", [178] = "Resist Paralyze", [179] = "Resist Blind", [180] = "Resist Silence", [181] = "Resist Petrify", [182] = "Resist Virus",
                    [183] = "Resist Curse", [184] = "Resist Stun", [185] = "Resist Bind", [186] = "Resist Gravity", [187] = "Resist Slow", [188] = "Resist Charm", [195] = "Subtle Blow", [198] = "Zanshin",
                    [329] = "Cure Potency", 
                    [512] = "STR", [513] = "DEX", [514] = "VIT", [515] = "AGI", [516] = "INT", [517] = "MND", [518] = "CHR", -- positives
                    [519] = "STR", [520] = "DEX", [521] = "VIT", [522] = "AGI", [523] = "INT", [524] = "MND", [525] = "CHR", -- negatives
                    [768] = "Fire resist", [769] = "Ice resist", [770] = "Wind resist", [771] = "Earth resist", [772] = "Lightning resist", [773] = "Water resist", [774] = "Light resist", [775] = "Dark resist",
                  };


--augid, min, max 
augmentable_items[13450] = { { 769, 0, 4 }, -- diamond ring, wiki order
                             { 516, 0, 2 },
                             { 517, 0, 2 },
                             { 180, 0, 2 },
                             { 53, 0, 4  } };

augmentable_items[13087] = { { 516, 0, 3 }, -- jeweled collar, wiki order
                             { 518, 0, 3 },
                             { 517, 0, 3 },
                             { 140, 0, 2 },
                             { 141, 0, 1 } };

augmentable_items[13925] = { { 182, 0, 4 }, -- rasetsu jinpachi, wiki order
                             { 183, 0, 2 },
                             { 768, 0, 3 },
                             { 198, 1, 4 },
                             { 31, 1, 9 } };

augmentable_items[13212] = { { 1, 2, 10  }, -- tarutaru sash, wiki order
                             { 516, 0, 3 },
                             { 517, 0, 2 },
                             { 518, 0, 2 },
                             { 148, 0, 2 },
                             { 147, 0, 0 } };
                        

augmentable_items[14644] = { { 56, 0, 5 }, -- dark rings, wiki order
                             { 54, 0, 5 },
                             { 55, 0, 5 },
                             { 42, 0, 2 },
                             { 53, 0, 4 },
                             { 33, 1, 3 } };

augmentable_items[16128] = { { 771, 0, 9 }, -- wivre hairpin, wiki order
                             { 773, 0, 7  },
                             { 769, 0, 7  },
                             { 775, 2, 9 },
                             { 9, 12, 15  },
                             { 138, 0, 0  } };

augmentable_items[12324] = { { 153, 0, 1 }, -- tower shield, wiki order
                             { 188, 0, 4 },
                             { 180, 0, 3 },
                             { 181, 0, 4 },
                             { 1, 1, 16  },
                             { 39, 0, 1  } };

augmentable_items[12420] = { { 53, 0, 2  }, -- adaman barbuta, wiki order
                             { 188, 0, 4 },
                             { 774, 2, 8 },
                             { 329, 1, 4 },
                             { 1, 15, 15 },
                             { 137, 0, 2 } };

augmentable_items[13464] = { { 133, 0, 2 }, -- demon's ring, wiki order
                             { 185, 0, 2 },
                             { 179, 0, 2 },
                             { 183, 0, 2 },
                             { 516, 0, 1 },
                             { 57, 0, 2  } };

augmentable_items[16265] = { { 9, 1, 4   }, -- wivre gorget, wiki order
                             { 1, 2, 3   },
                             { 513, 1, 1 },
                             { 195, 1, 4 },
                             { 41, 0, 1  },
                             { 772, 2, 3 } };

local aug_chances = { 100, 70, 50, 20 };

-- Skahnowa || Eraser --

local general_pool = {
                 { 768, 0, 4 }, -- resistances
                 { 769, 0, 4 },
                 { 770, 0, 4 },
                 { 771, 0, 4 },
                 { 772, 0, 4 },
                 { 773, 0, 4 },
                 { 774, 0, 4 },
                 { 775, 0, 4 },
                 { 1, 0, 14  }, -- HP 1-15
                 { 9, 0, 14  }, -- MP 1-15
                 { 18,  0, 0 }, -- hp mp +33
}
local gen_size = table.getn( general_pool );
 
local mob_specific_pool = {};
-- skahnowa
mob_specific_pool[17301593] = {
                                { 516, 0, 1 }, -- INT + 1-2
                                { 517, 0, 1 }, -- WIS + 1-2
                                { 518, 0, 1 }, -- CHR +1-2
                                { 134, 0, 2 }, -- magic defense
                                { 133, 0, 1 }, -- magic atk bonus
                                { 35, 0, 2  }, -- magic acc
                                { 323, 0, 2 }, -- Cure Casting Time
                                { 329, 0, 2 }, -- cure potency
                                { 57, 0, 1  }, -- magic crit chance
                                { 335, 0, 4 }, -- magic crit dmg
                                { 343, 0, 9 }, -- Drain + Aspir potency
                                { 141, 0, 1 }, -- conserve mp
                                { 40, 0, 2  }, -- -enmity
                                { 140, 0, 0 }, -- fast cast
			        { 108, 0, 1 }, -- pet: magic acc +1 magic atk +1
}

-- eraser
mob_specific_pool[17310106] = {
                                { 512, 0, 1 }, -- STR +2
                                { 513, 0, 1 }, -- DEX +2
                                { 514, 0, 1 }, -- AGI +2
                                { 25, 0, 3  }, -- atk
                                { 23, 0, 3  }, -- acc
                                { 41, 0, 0  }, -- crit chance
                                { 328, 0, 2 }, -- crit hit dmg
                                { 143, 0, 0 }, -- double atk
                                { 146, 0, 1 }, -- dual wield
                                { 139, 0, 0 }, -- rapid shot
                                { 145, 0, 0 }, -- coutner
                                { 153, 0, 0 }, -- shield mastery
                                { 211, 0, 0 }, -- snapshot
                                { 39, 0, 2  }, -- +enmity
                                { 330, 0, 2 }, -- waltz potency
                                { 31,  0, 9 }, -- evasion
                                { 109, 0, 1 }, -- pet: dbl atk +1 crit +1
}

local mob_size = { [17301593] = table.getn( mob_specific_pool[17301593] ), [17310106] = table.getn( mob_specific_pool[17310106] ) }

function onAugmentID(player, trade)
   local item = trade:getItemObj();
   local aug1, aug1val = item:getAugment(0);
   local aug2, aug2val = item:getAugment(1);
   local aug3, aug3val = item:getAugment(2);
   local aug4, aug4val = item:getAugment(3);

   if( aug4 ~= 0 ) then
      player:PrintToPlayer( string.format( "%d %d, %d %d, %d %d, %d %d", aug1, aug1val, aug2, aug2val, aug3, aug3val, aug4, aug4val ), 0xE);
   elseif( aug3 ~= 0 ) then
      player:PrintToPlayer( string.format( "%d %d, %d %d, %d %d", aug1, aug1val, aug2, aug2val, aug3, aug3val ), 0xE);
   elseif( aug2 ~= 0 ) then
      player:PrintToPlayer( string.format( "%d %d, %d %d", aug1, aug1val, aug2, aug2val ), 0xE );
   elseif( aug1 ~= 0 ) then
      player:PrintToPlayer( string.format( "%d %d", aug1, aug1val ), 0xE);
   end   
end;

function onAugmentTrade(player, trade)
   -- sanity checks
   if( trade:getItemCount() ~= 2 ) then
      player:PrintToPlayer( "You need to trade an item and a gil amount; or an augmented dagger and an augmentable item", 0xE );
      return;
   end

   local gil = trade:getGil();
   if( gil == 0 ) then
      local item_one = trade:getItem(0);
      local item_two = trade:getItem(1);
      local dagger, item_to_aug
      if( item_one == ITEM_DAGGER ) then
         dagger = trade:getItemObj(0);
         item_to_aug = trade:getItemObj(1);
      elseif( item_two == ITEM_DGGER ) then
         dagger = trade:getItemObj(1);
         item_to_aug = trade:getItemObj(0);
      else
         printf( "This one..." );
         player:PrintToPlayer( "You need to trade an item and a gil amount; or an augmented dagger and an augmentable item", 0xE );
         return;
      end

      if( item_to_aug:isSubType(4) == true ) then
         player:PrintToPlayer( "That item is already augmented, go cleanse it first!", 0xE );
         return;
      end

      if( item_to_aug:isType(0x08) == false and item_to_aug:isType(0x10) == false ) then
         player:PrintToPlayer( "You may only augment weapons or armor.", 0xE );
         return;
      end
      if( bit.band(item_to_aug:getFlag(), 16384 ) == 16384 ) then
         player:PrintToPlayer( "You cannot augment an EX item.", 0xE );
         return;      
      end

      if( bit.band(item_to_aug:getFlag(), 32768 ) == 32768 ) then
         player:PrintToPlayer( "You cannot augment a RARE item.", 0xE );
         return;
      end 
      local aug1, aug1val = dagger:getAugment(0);
      local aug2, aug2val = dagger:getAugment(1);
      local aug3, aug3val = dagger:getAugment(2);
      local aug4, aug4val = dagger:getAugment(3);

      player:addItem( item_to_aug:getID(), 1, aug1, aug1val, aug2, aug2val, aug3, aug3val, aug4, aug4val );
      player:tradeComplete()
      player:PrintToPlayer( "You plunge the dagger into the item and it melts on contact, enchanting its augments unto the item.", 0xE );
      return;
   end 

   local itemID = trade:getItem(1);
   if( augmentable_items[itemID] == nil ) then
      local amount = trade:getGil();
      local itemObj = trade:getItemObj(1);
      local itemID = itemObj:getID()
      if( itemID ~= ITEM_DAGGER ) then
         player:PrintToPlayer( "This item is not Augmentable", 0xE );
      else
         player:query( string.format( "UPDATE char_inventory SET bazaar=%d WHERE charid=%d and location=%d and slot=%d and itemId=%d", amount, player:getID(), itemObj:getLocationID(), itemObj:getSlotID(), itemObj:getID() ) );
         player:PrintToPlayer( "Dagger will be listed in your bazaar for " .. amount .. ", please zone for it to take effect.", 0xE );
      end
      return;
   end

   local itemObj = trade:getItemObj(1);
   if( itemObj:isSubType(4) == true ) then
      player:PrintToPlayer( "That item is already augmented.", 0xE );
      return;
   end

   if( gil ~= 1 and gil ~= 2 ) then
      player:PrintToPlayer( "You traded an improper gil amount.", 0xE );
      return;
   end

   augbuys = player:getVar( "AugBuys" );

   if( gil == 1 ) then
      augone = 75;
      augtwo = 25;
      if( augbuys < 1 ) then
         player:PrintToPlayer( "You don't have enough AugBuys", 0xE );
         return;
      else
         player:setVar( "AugBuys", augbuys - 1 );
      end
   elseif( gil == 2 ) then
      augone = 100;
      augtwo = 50;
      if( augbuys < 2 ) then
         player:PrintToPlayer( "You have have enough AugBuys", 0xE );
         return;
      else
         player:setVar( "AugBuys", augbuys - 2 );
      end
   end

   local aug_table = {}

   if( math.random(1,100) <= augone ) then
      augpos = math.random(1, #augmentable_items[itemID] );
      table.insert( aug_table, 1, augmentable_items[itemID][augpos][1] );
      table.insert( aug_table, 2, math.random( augmentable_items[itemID][augpos][2], augmentable_items[itemID][augpos][3] ) );
   end

   if( math.random(1,100) <= augtwo ) then
      augpostwo = math.random(1, #augmentable_items[itemID] );
      if( augpos ~= augpostwo ) then
         table.insert( aug_table, 1, augmentable_items[itemID][augpostwo][1] );
         table.insert( aug_table, 2, math.random( augmentable_items[itemID][augpostwo][2], augmentable_items[itemID][augpostwo][3] ) );
      end
   end

   if( aug_table[1] == nil ) then
      player:PrintToPlayer( "Bad luck, you didn't get any augments.", 0xE );
      return;
   else
      if( aug_table[3] ~= nil ) then
         player:addItem( itemID, 1, aug_table[1], aug_table[2], aug_table[3], aug_table[4] );
      else
         player:addItem( itemID, 1, aug_table[1], aug_table[2] );
      end
      player:PrintToPlayer( "Augment complete.", 0xE );
      player:tradeComplete();
   end
end;



function onFieldParchmentTrade(npc, player, trade)
   local lasttrade = player:getVar( string.format( "%dlasttrade", npc:getID() ) );

   if( lasttrade > os.time(t) ) then
      player:PrintToPlayer( string.format( "You need to wait %d minutes before you can trade again.", (lasttrade - os.time(t))/60), 0xE );
      return;
   end 

   if( trade:getItemCount() ~= 1 ) then
      player:PrintToPlayer( "You need to trade a gil amount in increments of 5k to the max of 20k.", 0xE );
      return;
   end

   local gil = trade:getGil();
   if( gil ~= 5000 and gil ~= 10000 and gil ~= 15000 and gil ~= 20000 ) then
      player:PrintToPlayer( "Improper gil value traded.", 0xE );
      return;
   end

   gil = gil / 5000;
   local availableaugs = player:getVar( "AugBuys" );
   if( availableaugs < gil ) then
      player:PrintToPlayer( "You do not have enough AugBuys", 0xE );
      return;
   end

   player:setVar( string.format( "%dNumAugs", npc:getID() ), gil );

   player:setVar( "AugBuys", availableaugs - gil );
   player:tradeComplete();
   player:setVar( string.format("%dlasttrade", npc:getID()), os.time(t) + ( 3600 * 3 ) );
   -- spawn proper mob
   if( npc:getID() == 17301593 ) then
      SpawnMob(17301539):updateClaim(player)
   elseif( npc:getID() == 17310106 ) then
      SpawnMob(17309984):updateClaim(player)
   end

   npc:setStatus(2);
end;

function getAugFromPool( pool )
   return pool[1], math.random( pool[2], pool[3] );
end;

function addAugToPool( pool, aug, val )
   if( pool[aug] ) then
      pool[aug] = pool[aug] + val + 1;
   else
      pool[aug] = val;
   end
end;

function onFieldParchmentTrigger(npc, player)
   local NPCID = npc:getID()
   local num_augs = player:getVar( NPCID .. "NumAugs" );
   local lasttrade = player:getVar( string.format( "%dlasttrade", npc:getID() ) );

   if( lasttrade > os.time(t) and num_augs == 0 ) then
      player:PrintToPlayer( string.format( "You need to wait %d minutes before you can trade again.", (lasttrade - os.time(t))/60), 0xE );
      return;
   end 

   if( num_augs == 0 ) then
      player:PrintToPlayer( "You need to trade an gil first(5k,10k,15k,20k) and have the AugBuys!", 0xE );
      return;
   end

   local mob_pool = mob_specific_pool[NPCID];
   local augments = {}
   local pick, aug, val
   -- grab out augs and put them into the "augments" table
   for i=1, num_augs, 1 do
      if( math.random(1,100) <= aug_chances[i] ) then
         if( i < 3 ) then -- dilute the first two pools with general
            pick = math.random( 1, gen_size + mob_size[NPCID] );
            if( pick < gen_size ) then
               aug, val = getAugFromPool( general_pool[pick] );
            else
               aug, val = getAugFromPool( mob_pool[pick - gen_size] )
            end
         else -- last two rolls, if successful are undiluted
            pick = math.random( 1, mob_size[NPCID] );
            aug, val = getAugFromPool( mob_pool[pick] )
         end
         addAugToPool( augments, aug, val );
      end
   end

   -- distribute our "augments" into friendly passing manner
   local augVal = {}
   local augID = {}
   local count = 1
   for k,v in pairs( augments ) do
      augID[count] = k;
      augVal[count] = v;
      count = count + 1;
   end

   player:PrintToPlayer( "Good luck!", 0xE );
   player:addItem( ITEM_DAGGER, 1, augID[1], augVal[1], augID[2], augVal[2], augID[3], augVal[3], augID[4], augVal[4] );
   player:setVar( string.format( "%dNumAugs", NPCID ), 0 );
end;
