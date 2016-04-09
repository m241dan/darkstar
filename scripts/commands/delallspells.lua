---------------------------------------------------------------------------------------------------
-- func: @delallspell <playername>
-- auth: Davenge
-- desc: Removes all spells from a player
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "s"
};

function onTrigger(player, target)

     local targ = GetPlayerByName(target);
     if (targ ~= nil) then
        for x = 1, 1004, 1 do
           targ:delSpell( x );
        end        
     else
         player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
         player:PrintToPlayer( "@delspell <spellID> <player>" );
     end
end;
