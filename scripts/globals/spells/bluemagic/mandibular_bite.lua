<<<<<<< HEAD
-----------------------------------------
-- Spell: Mandibular Bite
-- Damage varies with TP
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: INT+1
-- Level: 44
-- Casting Time: 0.5 seconds
-- Recast Time: 19.25 seconds
-- Skillchain property(ies): Induration (can open Impaction, Compression, or Fragmentation)
-- Combos: Plantoid Killer
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.tpmod = TPMOD_ATTACK;
        params.dmgtype = DMGTYPE_SLASH;
        params.scattr = SC_INDURATION;
        params.numhits = 1;
        params.multiplier = 2.0;
        params.tp150 = 1.2;
        params.tp300 = 1.4;
        params.azuretp = 1.5;
        params.duppercap = 45; --guesstimated attack % bonuses  
        params.str_wsc = 0.2;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.2;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
        params.system = SYSTEM_VERMIN;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    return damage;
end;
=======
-----------------------------------------
-- Spell: Mandibular Bite
-- Damage varies with TP
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: INT+1
-- Level: 44
-- Casting Time: 0.5 seconds
-- Recast Time: 19.25 seconds
-- Skillchain property(ies): Induration (can open Impaction, Compression, or Fragmentation)
-- Combos: Plantoid Killer
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.tpmod = TPMOD_ATTACK;
        params.dmgtype = DMGTYPE_SLASH;
        params.scattr = SC_INDURATION;
        params.numhits = 1;
        params.multiplier = 2.0;
        params.tp150 = 1.2;
        params.tp300 = 1.4;
        params.azuretp = 1.5;
        params.duppercap = 45; --guesstimated attack % bonuses  
        params.str_wsc = 0.2;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.2;
        params.mnd_wsc = 0.0;
        params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    return damage;
end;
>>>>>>> 5fce9ee42fb1ecdb2dea6d9ce39ed5bf25bbec97
