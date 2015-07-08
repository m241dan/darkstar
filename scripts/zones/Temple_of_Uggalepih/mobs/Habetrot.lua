-----------------------------------
-- Area: Temple of Uggalepih (159)
-- Mob: Habetrot
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
	GetNPCByID(17428850):hideNPC(900); -- 15min, qm8 in npc_list
end;