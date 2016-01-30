cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    player:PrintToPlayer( "Switching 1-80 with 81-160 in Mog Wardrobe", 0xE );
    player:swapContainerPage( 8, 1 );
end;


