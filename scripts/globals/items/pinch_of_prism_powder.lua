<<<<<<< HEAD
-----------------------------------------
--    ID: 4164
--    Prism Powder
--    When applied, it makes things invisible.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_INVISIBLE)) then
        target:addStatusEffect(EFFECT_INVISIBLE,0,10,math.random(300, 600));
    end
end;
=======
-----------------------------------------
--    ID: 4164
--    Prism Powder
--    When applied, it makes things invisible.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_INVISIBLE)) then
        target:addStatusEffect(EFFECT_INVISIBLE,0,10,math.random(60, 180));
    end
end;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
