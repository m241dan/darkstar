<<<<<<< HEAD
---------------------------------------------------------------------------------------------------
-- func: @ah
-- desc: opens the Auction House menu anywhere in the world just to see if we can
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player,npc)
   player:sendMenu(3);
end;
=======
---------------------------------------------------------------------------------------------------
-- func: @ah
-- desc: opens the Auction House menu anywhere in the world just to see if we can
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player,npc)
    player:sendMenu(3);
end;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
