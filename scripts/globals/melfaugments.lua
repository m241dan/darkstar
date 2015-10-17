-- Abyssea Augs --

augmentable_items = {}

augment_strings = { 
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

aug_chances = { 100, 70, 50, 20 };

-- Skahnowa || Eraser --

general_pool = {
                 { 768, 0, 4 }, -- resistances
                 { 769, 0, 4 },
                 { 770, 0, 4 },
                 { 771, 0, 4 },
                 { 772, 0, 4 },
                 { 773, 0, 4 },
                 { 774, 0, 4 },
                 { 775, 0, 4 },
                 { 512, 0, 0 }, -- +2 stats
                 { 513, 0, 0 },
                 { 514, 0, 0 },
                 { 515, 0, 0 },
                 { 516, 0, 0 },
                 { 517, 0, 0 },
                 { 518, 0, 0 },
                 { 1, 0, 14  }, -- HP 1-15
                 { 9, 0, 14  }, -- MP 1-15
}

one_time_pool = {
                  { 512, 0, 1 }, -- stat +2
                  { 513, 0, 1 },
                  { 514, 0, 1 },
                  { 515, 0, 1 },
                  { 516, 0, 1 },
                  { 517, 0, 1 },
                  { 518, 0, 1 },
                  { 18,  0, 0 }, -- hp mp +33
                  { 134, 0, 2 }, -- magic defense
                  { 133, 0, 1 }, -- magic atk bonus
                  { 23,  0, 4 }, -- acc
                  { 25,  0, 4 }, -- attack
                  { 31,  0, 9 }, -- evasion
}
 
mob_specific_pool = {};
-- skahnowa
mob_specific_pool[17301593] = { { 133, 0, 1 }, -- magic atk bonus
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
                                { 122, 0, 1 }, -- pet: tp bonus 20
}

-- eraser
mob_specific_pool[17310106] = { { 25, 0, 4  }, -- atk
                                { 23, 0, 4  }, -- acc
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
                                { 109, 0, 1 }, -- pet: dbl atk +1 crit +1
                                { 122, 0, 1 }, -- pet: tp bonus 20
}

item_pool = {};
item_pool[1]  = { { 33, 0, 9  }, -- Def armor
                      { 31, 0, 9  }, -- Evasion
                      { 134, 0, 1 }} -- Magic Defense

item_pool[2]  = { { 740, 0, 3 }, -- DMG+ melee
                      { 756, 9, 19}, -- -Delay
                      { 327, 0, 9 }} -- WeaponSkill DMG

item_pool[3] = { { 746, 0, 3 }, -- DMG+ ranged
                      { 764, 9, 19}, -- -Delay
                      { 327, 0, 9 }} -- WeaponSkill DMG


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
      player:PrintToPlayer( "You need to trade a gil amount, 1 or 2", 0xE );
      return;
   end

   local itemID = trade:getItem(1);
   if( augmentable_items[itemID] == nil ) then
      player:PrintToPlayer( "This item is not Augmentable", 0xE );
      return;
   end

   local itemObj = trade:getItemObj(1);
   if( itemObj:isSubType(4) == true ) then
      player:PrintToPlayer( "That item is already augmented.", 0xE );
      return;
   end

   local gil = trade:getGil();
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
   if( player:getVar( string.format("%dItemTraded", npc:getID() ) ) ~= 0 ) then
      player:PrintToPlayer( "You've already traded an item.", 0xE );
      return;
   end
   local lasttrade = player:getVar( string.format( "%dlasttrade", npc:getID() ) );

   if( lasttrade > os.time(t) ) then
      player:PrintToPlayer( string.format( "You need to wait %d minutes before you can trade again.", (lasttrade - os.time(t))/60), 0xE );
      return;
   end 

   if( trade:getItemCount() ~= 2 ) then
      player:PrintToPlayer( "You need to trade a gil amount and an item", 0xE );
      return;
   end


   local itemObj = trade:getItemObj(1);
   if( itemObj:isSubType(4) == true ) then
      player:PrintToPlayer( "That item is already augmented.", 0xE );
      return;
   end

   if( itemObj:isType(0x08) == false and itemObj:isType(0x10) == false ) then
      player:PrintToPlayer( "You may only augment weapons or armor.", 0xE );
      return;
   end
   if( bit.band(itemObj:getFlag(), 16384 ) == 16384 ) then
      player:PrintToPlayer( "You cannot augment an EX item.", 0xE );
      return;      
   end

   if( bit.band(itemObj:getFlag(), 32768 ) == 32768 ) then
      player:PrintToPlayer( "You cannot augment a RARE item.", 0xE );
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

   player:setVar( string.format( "%dItemTraded", npc:getID() ), itemObj:getID() );
   player:setVar( string.format( "%dNumAugs", npc:getID() ), gil );

   if( itemObj:getAHCat() == 13 ) then
      player:setVar( string.format( "%dItemType", npc:getID() ), 3 );
   elseif( itemObj:isType(8) == true ) then
      player:setVar( string.format( "%dItemType", npc:getID() ), 1 );
   else
      player:setVar( string.format( "%dItemType", npc:getID() ), 2 );
   end

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

function onFieldParchmentTrigger(npc, player)
   if( player:getVar( string.format( "%dItemTraded", npc:getID() ) ) == 0 ) then
      player:PrintToPlayer( "You need to trade an augmentable item, have AugBuys and gil first!", 0xE );
      return;
   end

   local generalPool = {};
   local itemPool = item_pool[player:getVar( string.format( "%dItemType", npc:getID() ) )];
   local mobSpecificPool = mob_specific_pool[npc:getID()];
   local selectedAugs = {};
   local augPool = { [1] = {}, [2] = {}, [3] = {}, [4] = {} };
   local itemObj = GetItemPtrByID( player:getVar( string.format( "%dItemTraded", npc:getID() ) ) );
   -- setup the general pool --

   for i,v in ipairs( general_pool ) do
      table.insert( generalPool, 1, v );
   end

   for i,v in ipairs( itemPool ) do
      table.insert( generalPool, 1, v );
   end

   -- build the aug pool
   table.insert( augPool[1], 1, generalPool );
   table.insert( augPool[1], 1, one_time_pool );
   table.insert( augPool[1], 1, mobSpecificPool );
   table.insert( augPool[2], 1, generalPool );
   table.insert( augPool[2], 1, mobSpecificPool );
   table.insert( augPool[3], 1, mobSpecificPool );
   table.insert( augPool[4], 1, mobSpecificPool );

   -- loop "NumAugs" times for the augs
   for i=1, player:getVar( string.format( "%dNumAugs", npc:getID() ) ), 1 do
      local augGroup;
      if( math.random(1,100) <= aug_chances[i] ) then
         augGroup = augPool[i][math.random(1,#augPool[i])];
         aug = augGroup[math.random(1,#augGroup)]
         local augval;
         if( aug[2] == aug[3] ) then
            augval = aug[2];
         else
            augval = math.random(aug[2], aug[3]);
         end
         if( itemObj:getAHCat() == 24 or itemObj:getAHCat() == 25 or itemObj:getAHCat() == 15 ) then
            augval = augval / 2
         end
         if( selectedAugs[aug[1]] ~= nil ) then
            selectedAugs[aug[1]] = selectedAugs[aug[1]] + augval; 
         else
            selectedAugs[aug[1]] = augval;
         end
      end
   end
   local augID = {};
   local augVal = {};
   for i,v in pairs( selectedAugs ) do
      local position = #augID;
      augID[position+1] = i;
      augVal[position+1] = v;
   end
   player:PrintToPlayer( "Good luck!", 0xE );
   player:addItem( player:getVar( string.format( "%dItemTraded", npc:getID() ) ), 1, augID[1], augVal[1], augID[2], augVal[2], augID[3], augVal[3], augID[4], augVal[4] );
   player:setVar( string.format( "%dItemTraded", npc:getID() ), 0 );
   player:setVar( string.format( "%dNumAugs", npc:getID() ), 0 );
   player:setVar( string.format( "%dItemType", npc:getID() ), 0 );
end;
