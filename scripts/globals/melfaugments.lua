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
                             { 1, 0, 14  },
                             { 9, 0, 14  },
                             { 140, 0, 2 },
                             { 51, 0, 1  },
                             { 52, 0, 1  },
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


function onAugmentID(player, trade)
end

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
   if( itemObj:getAugment(0) ~= 0) then
      player:PrintToPlayer( "You may not Augment the same item.", 0xE );
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
      player:tradeComplete();
   end
end;
