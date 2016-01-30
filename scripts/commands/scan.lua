
---------------------------------------------------------------------------------------------------
-- func: scan
-- auth: Jari Vetoniemi
-- desc: Scans target stats
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    local mob = player:getTarget();
    if (mob == nil) then
        return;
    end

    player:PrintToPlayer(
    string.format("%s HP: %i/%i MP: %i/%i ACC: %i EVA: %i\nSTR: %i DEX: %i VIT: %i AGI: %i MND: %i CHR: %i ATT: %i DEF: %i\n",
    mob:getName(), mob:getHP(), mob:getMaxHP(), mob:getMP(), mob:getMaxMP(), mob:getACC(), mob:getEVA(),
    mob:getStat(MOD_STR), mob:getStat(MOD_DEX), mob:getStat(MOD_VIT), mob:getStat(MOD_AGI), mob:getStat(MOD_INT), mob:getStat(MOD_INT),
    mob:getStat(MOD_MND), mob:getStat(MOD_CHR), mob:getStat(MOD_ATT), mob:getStat(MOD_DEF)));
end
