-----------------------------------------
-- Spell: Frypan
-- Delivers an area attack. Additional effect: "Stun." Accuracy varies with TP
-- Spell cost: 65 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: DEX+2
-- Level: 63
-- Casting Time: 1 seconds
-- Recast Time: 26 seconds
-- Skillchain Element(s): Lightning (can open Liquefaction or Detonation; can close Impaction or Fusion)
-- Combos: Max HP Boost
-----------------------------------------
require("scripts/globals/bluemagic");
require("scripts/globals/status");
require("scripts/globals/magic");

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
    local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    local resist = applyResistanceEffect(caster,spell,target,dINT,SKILL_BLU,0,EFFECT_STUN)
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.tpmod = TPMOD_ACC;
        params.dmgtype = DMGTYPE_BLUNT;
        params.scattr = SC_IMPACTION;
        params.numhits = 1;
        params.multiplier = 1.78;
        params.tp150 = 1.78;
        params.tp300 = 1.78;
        params.azuretp = 1.78;
        params.duppercap = 75;
        params.str_wsc = 0.2;
        params.dex_wsc = 0.0;
        params.vit_wsc = 0.0;
        params.agi_wsc = 0.0;
        params.int_wsc = 0.0;
        params.mnd_wsc = 0.2;
        params.chr_wsc = 0.0;
    local damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);

    if (resist > 0.5) then -- This line may need adjusting for retail accuracy.
        target:addStatusEffect(EFFECT_STUN, 1, 0, 5 * resist); -- pre-resist duration needs confirmed/adjusted
    end

    return damage;
end;
