<<<<<<< HEAD
---------------------------------------------------------------------------------------------------
-- func: wallhack
-- desc: Allows the player to walk through walls.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    player:setFlag( 0x00000200 );
end
=======
---------------------------------------------------------------------------------------------------
-- func: wallhack
-- desc: Allows the player to walk through walls.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    player:setFlag( 0x00000200 );
end
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
