---------------------------------------------------------------------------------------------------
-- func: @giveentries <amount> <player1> <player2> <player3> <player4> <player5> <player6>
-- desc: Gives the specified amount of DynamisEntries to each player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "issssss"
};

function onTrigger(player, amount, target1, target2, target3, target4, target5, target6)
    if (amount == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        player:PrintToPlayer( "@giveentries <amount> <players1-6>" );
        return;
    end

	-- String to output all the people given entries	
	local str = {amount .. " entries added to: "};
	
	-- Add entries (up to the maximum allowed - 3)
    target1 = GetPlayerByName(target1);
    if (target1 ~= nil) then
        target1:setVar("DynamisEntries", math.min(3, target1:getVar("DynamisEntries")+amount));
        table.insert(str, target1:getName() .. " ");
    else
        player:PrintToPlayer("You must enter the name of at least one player.");
        player:PrintToPlayer( "@giveentries <amount> <players1-6>" );
       return;
    end
    target2 = GetPlayerByName(target2);
    if (target2 ~= nil) then
        target2:setVar("DynamisEntries", math.min(3, target2:getVar("DynamisEntries")+amount));
	table.insert(str, target2:getName() .. " ");
    end
    target3 = GetPlayerByName(target3);
    if (target3 ~= nil) then
        target3:setVar("DynamisEntries", math.min(3, target3:getVar("DynamisEntries")+amount));
	table.insert(str, target3:getName() .. " ");
    end
    target4 = GetPlayerByName(target4);
    if (target4 ~= nil) then
        target4:setVar("DynamisEntries", math.min(3, target4:getVar("DynamisEntries")+amount));
        table.insert(str, target4:getName() .. " ");
    end
    target5 = GetPlayerByName(target5);
    if (target5 ~= nil) then
        target5:setVar("DynamisEntries", math.min(3, target5:getVar("DynamisEntries")+amount));
        table.insert(str, target5:getName() .. " ");
    end
    targe6 = GetPlayerByName(target6);
    if (target6 ~= nil) then
        target6:setVar("DynamisEntries", math.min(3, target6:getVar("DynamisEntries")+amount));
        table.insert(str, target6:getName() .. " ");
    end

    -- Concatenate the string and output it
    player:PrintToPlayer(table.concat(str), 0xE);
	
end;
