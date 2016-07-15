require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")

local BCTable = {
    [SYSTEM_AMORPH]   = { [SYSTEM_BIRD]     = 1.25, [SYSTEM_AQUAN]    = .75 },
    [SYSTEM_AQUAN]    = { [SYSTEM_AMORPH]   = 1.25, [SYSTEM_BIRD]     = .75 },
    [SYSTEM_BIRD]     = { [SYSTEM_AQUAN]    = 1.25, [SYSTEM_AMORPH]   = .75 },

    [SYSTEM_ARCANA]   = { [SYSTEM_UNDEAD]   = 1.25 },
    [SYSTEM_UNDEAD]   = { [SYSTEM_ARCANA]   = 1.25 },

    [SYSTEM_DEMON]    = { [SYSTEM_DRAGON]   = 1.25 },
    [SYSTEM_DRAGON]   = { [SYSTEM_DEMON]    = 1.25 },

    [SYSTEM_LUMORIAN] = { [SYSTEM_LUMINION] = 1.25 },
    [SYSTEM_LUMINION] = { [SYSTEM_LUMORIAN] = 1.25 },

    [SYSTEM_BEAST]    = { [SYSTEM_LIZARD]   = 1.25, [SYSTEM_PLANTOID] = .75 },
    [SYSTEM_LIZARD]   = { [SYSTEM_VERMIN]   = 1.25, [SYSTEM_BEAST]     = .75 },
    [SYSTEM_PLANTOID] = { [SYSTEM_BEAST]    = 1.25, [SYSTEM_VERMIN]   = .75 },
    [SYSTEM_VERMIN]   = { [SYSTEM_PLANTOID] = 1.25, [SYSTEM_LIZARD]   = .75 },
};

BLUE_SKILL = 43;

-- The type of spell.
SPELLTYPE_PHYSICAL = 0;
SPELLTYPE_MAGICAL = 1;
SPELLTYPE_RANGED = 2;
SPELLTYPE_BREATH = 3;
SPELLTYPE_DRAIN = 4;
SPELLTYPE_SPECIAL = 5;

-- The TP modifier
TPMOD_NONE = 0;
TPMOD_CRITICAL = 1;
TPMOD_DAMAGE = 2;
TPMOD_ACC = 3;
TPMOD_ATTACK = 4;

-- The damage type for the spell
DMGTYPE_BLUNT = 0;
DMGTYPE_PIERCE = 1;
DMGTYPE_SLASH = 2;
DMGTYPE_H2H = 3;

-- The SC the spell makes
SC_IMPACTION = 0;
SC_TRANSFIXION = 1;
SC_DETONATION = 2;
SC_REVERBERATION = 3;
SC_SCISSION = 4;
SC_INDURATION = 5;
SC_LIQUEFACTION = 6;
SC_COMPRESSION = 7;

SC_FUSION = 8;
SC_FRAGMENTATION = 9;
SC_DISTORTION = 10;
SC_GRAVITATION = 11;

SC_DARK = 12;
SC_LIGHT = 13;

INT_BASED = 1;
CHR_BASED = 2;
MND_BASED = 3;

-- Get the damage for a blue magic physical spell.
-- caster - The entity casting the spell.
-- target - The target of the spell.
-- spell - The blue magic spell itself.
-- params - The parameters for the spell. Broken down into:
--      .tpmod - The TP modifier for the spell (e.g. damage varies, critical varies with TP, etc). Should be a TPMOD_xxx enum.
--      .numHits - The number of hits in the spell.
--      .multiplier - The base multiplier for the spell (not under Chain Affinity) - Every spell must specify this. (equivalent to TP 0%)
--      .tp150 - The TP modifier @ 150% TP (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%).
--               This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .tp300 - The TP modifier @ 300% TP (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%)
--               This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .azuretp - The TP modifier under Azure Lore (damage multiplier, crit chance, etc. 1.0 = 100%, 2.0 = 200% NOT 100=100%)
--                  This value is interpreted as crit chance or dmg multiplier depending on the TP modifier (tpmod).
--      .duppercap - The upper cap for D for this spell.
--      .str_wsc - The decimal % value for STR % (e.g. STR 20% becomes 0.2)
--      .dex_wsc - Same as above.
--      .vit_wsc - Same as above.
--      .int_wsc - Same as above.
--      .mnd_wsc - Same as above.
--      .chr_wsc - Same as above.
--      .agi_wsc - Same as above.
function BluePhysicalSpell(caster, target, spell, params)
    -- TODO: Under Efflux?
    -- TODO: Merits.
    -- TODO: Under Azure Lore.
    -- TODO: TP mods for Attack? Accuracy? Crit Hit Rate? No numbers available Q_Q

    ---------------------------------
    -- Calculate the final D value  -
    ---------------------------------
    -- worked out from http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- Final D value ??= floor(D+fSTR+WSC) * Multiplier
    local magicskill = caster:getSkillLevel(BLUE_SKILL) + caster:getMod(79 + BLUE_SKILL); -- Base skill + equip mods
    local D =  math.floor((magicskill * 0.11)) * 2 + 3;
    -- each spell has its inddividual D Upper Cap
    if (D > params.duppercap) then
        D = params.duppercap;
    end
    --print("D val is ".. D);


    ---------------------------------
    -- Get the fStr                --
    ---------------------------------
    local fStr = BluefSTR(caster:getStat(MOD_STR) - target:getStat(MOD_VIT));
    if (fStr > 22) then
        fStr = 22; -- TODO: Smite of Rage doesn't have this cap applied.
    end
    --print("fStr val is ".. fStr);


    ---------------------------------
    -- Get the WSC                 --
    ---------------------------------
    local WSC = BlueGetWsc(caster, params);
    --print("wsc val is ".. WSC);



    ---------------------------------
    -- Get the fTP                 --
    ---------------------------------
    local fTP = params.multiplier;
    --print( "fTP is " .. fTP );


    ---------------------------------
    -- Handle Chain Affinity       --
    ---------------------------------
    -- If under CA, double WSC and apply enchainment merits
    local critchance = 0;
    local atkmod = params.atkmod or 1.0;
    local accmod = params.accmod or 1.0;
    local tp = caster:getTP() + caster:getMerit(MERIT_ENCHAINMENT);
    if( caster:hasStatusEffect(EFFECT_CHAIN_AFFINITY) ) then
        -- Calculate the total TP available for the fTP multiplier.
        if tp > 300 then
            tp = 300;
        end;
        WSC = WSC * 2; -- wsc doubled under chain affinity on physical spells, maybe magic, too? notes don't say so just putting it here

       -- gets a bit messy here...
       if( params.tpmod == TPMOD_DAMAGE ) then
          fTP = BluefTP(tp, fTP, params.tp150, params.tp300);
       elseif( params.tpmod == TPMOD_CRITICAL ) then
          if( tp >= 150 and tp < 300 ) then
             critchance = params.tp150 or 0;
          elseif( tp == 300 ) then
             critchance = params.tp300 or 0;             
          end
          critchance = critchance + caster:getMod(MOD_CRITHITRATE);
       elseif( params.tpmod == TPMOD_ATTACK ) then
          if( tp >= 150 and tp < 300 ) then
             atkmod = params.tp150 or 1;
          elseif( tp == 300 ) then
             atkmod = params.tp300 or 1;
          end
       elseif( params.tpmod == TPMOD_ACC ) then
          if( tp >= 150 and tp < 300 ) then
             accmod = params.tp150;
          elseif( tp == 300 ) then
             accmod = params.tp300;
          end
       end
    end;
     --print( "tp is " .. tp .. " and wsc is " .. WSC );
     --print( "ftp is " .. fTP );


    ---------------------------------
    --  Calc pDif / cpDif          --
    ---------------------------------
    -- Blue Mage has its own attack unless its cannonball
    if (params.offcratiomod == nil) then
        if( SEEKERS_BLUE_MAGE ) then
           params.offcratiomod = caster:getStat(MOD_ATT);
        else
           params.offcratiomod = caster:getSkillLevel(BLUE_SKILL) + caster:getMod(79 + BLUE_SKILL) + ( caster:getMod( MOD_STR ) / 2 );
        end
    end;
    params.offcratiomod = params.offcratiomod * atkmod;
     --print(params.offcratiomod)
    local cratio, ccratio = BluecRatio(caster,params.offcratiomod / target:getStat(MOD_DEF), caster:getMainLvl(), target:getMainLvl());
    --print( string.format( "pDifMin is %d and pDifMax is %d", cratio[1], cratio[2] ) );
    --print( string.format( "cpDifMin is %d and cpDifMax is %d", ccratio[1], ccratio[2] ) );


    ---------------------------------
    -- Handle Azure Lore           --
    ---------------------------------
    if( caster:hasStatusEffect(EFFECT_AZURE_LORE) ) then
       if( params.tpmod == TPMOD_DAMAGE and params.azuretp ) then
          fTP = params.azuretp;
       end
    end


    ---------------------------------
    -- Calculate the Base Hit Dmg  --
    ---------------------------------
    local baseHit = math.floor(D + fStr + WSC);
    --print( "baseHit is " .. baseHit );


    ---------------------------------
    -- Beast Correlation Multi     --
    ---------------------------------
    local BC = 1;
    if( BCTable[params.system] ) then
        BC = BCTable[params.system][target:getSystem()] or 1;
        if( BC > 1 ) then
           local head = caster:getEquipID(SLOT_HEAD);
           local BCMerit = caster:getMerit(MERIT_MONSTER_CORRELATION);
           if( head == 15265 or head == 11464 ) then
              BC = BC + .02;
           end
           if( BCMerit > 0 ) then
              BC = BC + ( BCMerit / 100 );
           end
        end
    end

    ---------------------------------
    -- Get the hirate              --
    ---------------------------------
    local hitrate = BlueGetHitRate(caster,target,true,accmod);
    --print( "Hit rate " .. hitrate );



    -------------------------
    -- Perform the attacks --
    -------------------------
    local hitsdone = 0;
    local hitslanded = 0;
    local finaldmg = 0;

    while (hitsdone < params.numhits) do
        local chance = math.random();
        if (chance <= hitrate and not target:hasStatusEffect(EFFECT_ALL_MISS) ) then -- it hit
            -- TODO: Check for shadow absorbs.

            -- Generate a random pDIF between min and max
            local pdif;
            if( hitsdone == 0 and ( ( caster:hasStatusEffect(EFFECT_SNEAK_ATTACK) and caster:isBehind(target) ) or critchance > math.random((1),(100)) ) ) then
                pdif = math.random((ccratio[1]*1000),(ccratio[2]*1000));
                pdif = pdif/1000;
            else
                pdif = math.random((cratio[1]*1000),(cratio[2]*1000));
                pdif = pdif/1000;
            end
            -- Apply it to our final D
            if (hitsdone == 0) then -- only the first hit benefits from multiplier
                finaldmg = baseHit * ( fTP + ( BC - 1 ) ) * pdif; -- ftp only used on the first hit
            else
                finaldmg = finaldmg + ( baseHit * BC * pdif );
            end

            hitslanded = hitslanded + 1;

            -- increment target's TP (10TP per hit landed)
            target:addTP(10);
        end

        hitsdone = hitsdone + 1;
    end

    if( params.dmgtype == DMGTYPE_H2H ) then
        finaldmg = finaldmg * target:getMod(MOD_HTHRES) / 1000;
    elseif( params.dmgtype == DMGTYPE_PIERCE ) then
        finaldmg = finaldmg * target:getMod(MOD_PIERCERES) / 1000;
    elseif( params.dmgtype == DMGTYPE_BLUNT ) then
        finaldmg = finaldmg * target:getMod(MOD_IMPACTRES) / 1000;
    else
        finaldmg = finaldmg * target:getMod(MOD_SLASHRES) / 1000;
    end

    finaldmg = target:physicalDmgTaken(finaldmg);

    --print("Hits landed "..hitslanded.."/"..hitsdone.." for total damage: "..finaldmg);
    if( caster:hasStatusEffect(EFFECT_TRICK_ATTACK) and caster:isTrickAttackAvailable(target) ) then
       params.enmTarget = caster:getTrickTarget();       
    else
       params.enmTarget = caster;
    end
    caster:delStatusEffect(EFFECT_SNEAK_ATTACK);
    caster:delStatusEffect(EFFECT_TRICK_ATTACK);	
    return finaldmg;
end;

-- Blue Magical type spells

function BlueMagicalSpell(caster, target, spell, params, statMod)
    local D = caster:getMainLvl() + 2;

    if (D > params.duppercap) then
        D = params.duppercap;
    end

    local ST = BlueGetWsc(caster, params); -- According to Wiki ST is the same as WSC, essentially Blue mage spells that are magical use the dmg formula of Magical type Weapon skills

    if (caster:hasStatusEffect(EFFECT_BURST_AFFINITY)) then
        ST = ST * 2;
    end

    local convergenceBonus = 1.0;
    if (caster:hasStatusEffect(EFFECT_CONVERGENCE)) then
        convergenceEffect = getStatusEffect(EFFECT_CONVERGENCE);
        local convLvl = convergenceEffect:getPower();
        if (convLvl == 1) then
            convergenceBonus = 1.05;
        elseif (convLvl == 2) then
            convergenceBonus = 1.1;
        elseif (convLvl == 3) then
            convergenceBonus = 1.15;
        end
    end

    local statBonus = 0;
    local dStat = 0; -- Please make sure to add an additional stat check if there is to be a spell that uses neither INT, MND, or CHR. None currently exist.
    if (statMod == INT_BASED) then -- Stat mod is INT
        dStat = caster:getStat(MOD_INT) - target:getStat(MOD_INT)
        statBonus = (dStat)* params.tMultiplier;
    elseif (statMod == CHR_BASED) then -- Stat mod is CHR
        dStat = caster:getStat(MOD_CHR) - target:getStat(MOD_CHR)
        statBonus = (dStat)* params.tMultiplier;
    elseif (statMod == MND_BASED) then -- Stat mod is MND
        dStat = caster:getStat(MOD_MND) - target:getStat(MOD_MND)
        statBonus = (dStat)* params.tMultiplier;
    end

    D =(((D + ST) * params.multiplier * convergenceBonus) + statBonus);

    -- At this point according to wiki we apply standard magic attack calculations

    local magicAttack = 1.0;
    local multTargetReduction = 1.0; -- TODO: Make this dynamically change, temp static till implemented.
    magicAttack = math.floor(D * multTargetReduction);
    magicAttack = math.floor(magicAttack * applyResistance(caster,spell,target,dStat,BLUE_SKILL,0));
    dmg = math.floor(addBonuses(caster, spell, target, magicAttack));
    dmg = target:magicDmgTaken(dmg);
    caster:delStatusEffectSilent(EFFECT_BURST_AFFINITY);
    params.enmTarget = caster;
    return dmg;
end;

function BlueFinalAdjustments(caster, target, spell, dmg, params)
    if (dmg < 0) then
        dmg = 0;
    end

    dmg = dmg * BLUE_POWER;

    dmg = dmg - target:getMod(MOD_PHALANX);
    if (dmg < 0) then
        dmg = 0;
    end

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg);

    target:delHP(dmg);
    target:updateEnmityFromDamage(params.enmTarget,dmg);
    target:handleAfflatusMiseryDamage(dmg);
    -- TP has already been dealt with.
    return dmg;
end;

------------------------------
-- Utility functions below ---
------------------------------

function BlueGetWsc(attacker, params)
    wsc = (attacker:getStat(MOD_STR) * params.str_wsc + attacker:getStat(MOD_DEX) * params.dex_wsc +
         attacker:getStat(MOD_VIT) * params.vit_wsc + attacker:getStat(MOD_AGI) * params.agi_wsc +
         attacker:getStat(MOD_INT) * params.int_wsc + attacker:getStat(MOD_MND) * params.mnd_wsc +
         attacker:getStat(MOD_CHR) * params.chr_wsc) * BlueGetAlpha(attacker:getMainLvl());
    if( attacker:hasStatusEffect(EFFECT_CHAIN_AFFINITY) ) then
       return wsc * 2;
    end
    return wsc;
end;

--Given the raw ratio value (atk/def) and levels, returns the cRatio (min then max)
function BluecRatio(attacker,ratio,atk_lvl,def_lvl)
    --Level penalty...
    local levelcor = 0;
    if (atk_lvl < def_lvl) then
        levelcor = 0.05 * (def_lvl - atk_lvl);
    end
    ratio = ratio - levelcor;

    --apply caps
    ratio = utils.clamp( ratio, 0, 2 );

    --Obtaining cRatio_MIN
    local cratiomin = 0;
    if (ratio<1.25) then
        cratiomin = 1.2 * ratio - 0.5;
    elseif (ratio>=1.25 and ratio<=1.5) then
        cratiomin = 1;
    elseif (ratio>1.5 and ratio<=2) then
        cratiomin = 1.2 * ratio - 0.8;
    end

    --Obtaining cRatio_MAX
    local cratiomax = 0;
    if (ratio<0.5) then
        cratiomax = 0.4 + 1.2 * ratio;
    elseif (ratio<=0.833 and ratio>=0.5) then
        cratiomax = 1;
    elseif (ratio<=2 and ratio>0.833) then
        cratiomax = 1.2 * ratio;
    end
    if (cratiomin < 0) then
        cratiomin = 0;
    end

    -- stolen and adjusted a bit from weaponskills.lua

    local pdif = {}
    pdif[1] = cratiomin;
    pdif[2] = cratiomax;

    local pdifcrit = {};
    ratio = ratio + 1;
    ratio = utils.clamp(ratio, 0, 3);

    --printf("ratio: %f min: %f max %f\n", cratio, pdifmin, pdifmax);

    --max
    if (ratio < 0.5) then
        pdifmax = ratio + 0.5;
    elseif (ratio < 0.7) then
        pdifmax = 1;
    elseif (ratio < 1.2) then
        pdifmax = ratio + 0.3;
    elseif (ratio < 1.5) then
        pdifmax = (ratio * 0.25) + ratio;
    elseif (ratio < 1.5) then
        pdifmax = ratio + 0.375;
    else
        pdifmax = 3;
    end

    --min
    if (ratio < 0.38) then
        pdifmin = 0;
    elseif (ratio < 1.25) then
        pdifmin = ratio * (1176/1024) - (448/1024);
    elseif (ratio < 1.51) then
        pdifmin = 1;
    elseif (ratio < 2.44) then
        pdifmin = ratio * (1176/1024) - (775/1024);
    else
        pdifmin = ratio - 0.375;
    end

    local critbonus = attacker:getMod(MOD_CRIT_DMG_INCREASE)
    critbonus = utils.clamp(critbonus, 0, 100);
    pdifcrit[1] = pdifmin * ((100 + critbonus)/100);
    pdifcrit[2] = pdifmax * ((100 + critbonus)/100);

    return pdif, pdifcrit;
end;

-- Gets the fTP multiplier by applying 2 straight lines between ftp1-ftp2 and ftp2-ftp3
-- tp - The current TP
-- ftp1 - The TP 0% value
-- ftp2 - The TP 150% value
-- ftp3 - The TP 300% value
function BluefTP(tp,ftp1,ftp2,ftp3)
    if (tp>=0 and tp<150) then
        return ftp1 + ( ((ftp2-ftp1)/100) * tp);
    elseif (tp>=150 and tp<=300) then
        --generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3-ftp2)/100) * (tp-150));
    else
        print("blue fTP error: TP value is not between 0-300!");
    end
    return 1; --no ftp mod
end;

function BluefSTR(dSTR)
    if (dSTR >= 12) then
        fSTR2 = ((dSTR+4)/2);
    elseif (dSTR >= 6) then
        fSTR2 = ((dSTR+6)/2);
    elseif (dSTR >= 1) then
        fSTR2 = ((dSTR+7)/2);
    elseif (dSTR >= -2) then
        fSTR2 = ((dSTR+8)/2);
    elseif (dSTR >= -7) then
        fSTR2 = ((dSTR+9)/2);
    elseif (dSTR >= -15) then
        fSTR2 = ((dSTR+10)/2);
    elseif (dSTR >= -21) then
        fSTR2 = ((dSTR+12)/2);
    else
        fSTR2 = ((dSTR+13)/2);
    end

    return fSTR2;
end;

function BlueGetHitRate(attacker,target,capHitRate,bonusMulti)
    local acc = attacker:getACC() * bonusMulti;
    local eva = target:getEVA();

    if (attacker:getMainLvl() > target:getMainLvl()) then --acc bonus!
        acc = acc + ((attacker:getMainLvl()-target:getMainLvl())*4);
    elseif (attacker:getMainLvl() < target:getMainLvl()) then --acc penalty :(
        acc = acc - ((target:getMainLvl()-attacker:getMainLvl())*4);
    end

    local hitdiff = 0;
    local hitrate = 75;
    if (acc>eva) then
    hitdiff = (acc-eva)/2;
    end
    if (eva>acc) then
    hitdiff = ((-1)*(eva-acc))/2;
    end

    hitrate = hitrate+hitdiff;
    hitrate = hitrate/100;


    --Applying hitrate caps
    if (capHitRate) then --this isn't capped for when acc varies with tp, as more penalties are due
        if (hitrate>0.95) then
            hitrate = 0.95;
        end
        if (hitrate<0.2) then
            hitrate = 0.2;
        end
    end
    return hitrate;
end;

-- Function to stagger duration of effects by using the resistance to change the value

function getBlueEffectDuration(caster,resist,effect)

    local duration = 0;

    if (resist == 0.125) then
        resist = 1;
    elseif (resist == 0.25) then
        resist = 2;
    elseif (resist == 0.5) then
        resist = 3;
    else
        resist = 4;
    end

    if (effect == EFFECT_BIND) then
        duration = math.random(0,5) + resist * 5;
    elseif (effect == EFFECT_STUN) then
        duration = math.random(2,3) + resist;
    elseif (effect == EFFECT_WEIGHT) then
        duration = math.random(20,24) + resist * 9; -- 30-60
    elseif (effect == EFFECT_PARALYSIS) then
        duration = math.random(50,60) + resist * 15; --60- 120
    end
    printf("Duration of stun is %i",duration);
    return duration;
end;

--obtains alpha, used for working out WSC
function BlueGetAlpha(level)
alpha = 1.00;
if (level <= 5) then
    alpha = 1.00;
elseif (level <= 11) then
    alpha = 0.99;
elseif (level <= 17) then
    alpha = 0.98;
elseif (level <= 23) then
    alpha = 0.97;
elseif (level <= 29) then
    alpha = 0.96;
elseif (level <= 35) then
    alpha = 0.95;
elseif (level <= 41) then
    alpha = 0.94;
elseif (level <= 47) then
    alpha = 0.93;
elseif (level <= 53) then
    alpha = 0.92;
elseif (level <= 59) then
    alpha = 0.91;
elseif (level <= 61) then
    alpha = 0.90;
elseif (level <= 63) then
    alpha = 0.89;
elseif (level <= 65) then
    alpha = 0.88;
elseif (level <= 67) then
    alpha = 0.87;
elseif (level <= 69) then
    alpha = 0.86;
elseif (level <= 71) then
    alpha = 0.85;
elseif (level <= 73) then
    alpha = 0.84;
elseif (level <= 75) then
    alpha = 0.83;
elseif (level <= 99) then
    alpha = 0.85;
end
return alpha;
end;
