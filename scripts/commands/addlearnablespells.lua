
---------------------------------------------------------------------------------------------------
-- func: addlearnablespells.lua
-- auth: Davenge
-- desc: Adds all the spells a player could have on a their current job
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, target)

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        for x = 1, 1004, 1 do
           if( targ:canLearnSpell( x ) ) then
              targ:addSpell( x );            
           end
        end
    end
end
