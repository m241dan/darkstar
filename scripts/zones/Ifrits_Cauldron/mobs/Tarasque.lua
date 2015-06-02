-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  Tarasque
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetNPCByID(17617179):hideNPC(900); -- 15min, qm1 in npc_list
end;