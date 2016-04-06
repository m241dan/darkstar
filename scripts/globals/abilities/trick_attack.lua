<<<<<<< HEAD
-----------------------------------
-- Ability: Trick Attack
-- Deals extra damage when striking from behind a party or alliance member.
-- Obtained: Thief Level 30
-- Recast Time: 1:00
-- Duration: 1:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
   player:addStatusEffect(EFFECT_TRICK_ATTACK,1,0,60);
   if( player:delay() < 2000 ) then
      player:delay(2000);
   end
end;
=======
-----------------------------------
-- Ability: Trick Attack
-- Deals extra damage when striking from behind a party or alliance member.
-- Obtained: Thief Level 30
-- Recast Time: 1:00
-- Duration: 1:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
   player:addStatusEffect(EFFECT_TRICK_ATTACK,1,0,60);
end;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
