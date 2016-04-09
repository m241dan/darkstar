---------------------------------------------------------------------------------------------------
-- func: godmode
-- desc: Toggles god mode on the player; granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    if (player:getVar("InvincibleMode") == 0) then
        -- Toggle Invincible on..
        player:setVar("InvincibleMode", 1);

        -- Add bonus effects to the player..
        player:addStatusEffect(EFFECT_SENTINEL,100,0,0);
        player:addStatusEffect(EFFECT_PERFECT_DODGE,1,0,0);
        player:addStatusEffect(EFFECT_INVINCIBLE,1,0,0);
        player:addStatusEffect(EFFECT_MANAFONT,1,0,0);
        player:addStatusEffect(EFFECT_RAMPART,1,0,0);
        player:addStatusEffect(EFFECT_FEALTY,5,0,0);
        player:addStatusEffect(EFFECT_REGAIN,150,1,0);

    else
        -- Toggle GodMode off..
        player:setVar("InvincibleMode", 0);

        -- Remove bonus effects..
        player:delStatusEffect(EFFECT_SENTINEL);
        player:delStatusEffect(EFFECT_PERFECT_DODGE);
        player:delStatusEffect(EFFECT_INVINCIBLE);
        player:delStatusEffect(EFFECT_MANAFONT);
        player:delStatusEffect(EFFECT_FEALTY);
        player:delStatusEffect(EFFECT_REGAIN);
    end
end
