cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    if( player:getName() ~= "Melfie" ) then
       return;
    end
    player:swapContainerPage( 8, 1 );
end;


