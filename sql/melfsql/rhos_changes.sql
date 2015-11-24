-- Tarasque's Spawn Point
UPDATE mob_spawn_points SET pos_x=124, pos_y=19, pos_z=163, pos_rot=100 WHERE mobname="Tarasque";

-- Updates spell_list.sql so that "Divine Veil"  works (added AOE = 7 for Divine Veil)
-- (These spells also work with SCH's Accession, so SCH needs to check for both AOE=4 and AOE=7)
-- UPDATE spell_list SET AOE=4 WHERE name="poisona" OR name="paralyna" OR name="silena" OR name="blindna" OR name="cursna" OR name="stona" OR name="erase";

-- Correct droplist for Thread Leeches (in Pashhow Marshlands, zoneID = 109)
-- (poolid = 5133; vial of beastman's blood = 930; dropid = 3472; vial of fiend blood = 924)
DELETE FROM mob_droplist WHERE dropId=3472 AND itemId=924;

-- Adjust Dread Dealing Dredodak's Spawn Point
UPDATE mob_spawn_points SET pos_x=-137, pos_y=7.57, pos_z=146 WHERE mobId=16822462;

-- Buff the Dragon Family (+STR, +Elemental Resistance)
UPDATE mob_family_system SET STR=3, Light=.9, Dark=.75, Fire=.9, Ice=.9, Water=.9, Lightning=.9, Earth=.9, Wind=.9 WHERE family="Dragon";

-- This Rumble Crawler should only spawn in place of Habetrot
-- (Give its a new group in mob_groups and changes it to forced spawn)
-- INSERT INTO mob_groups VALUES (14334,3415,159,1056,128,3015,0,0,53,56,0,0);
UPDATE mob_spawn_points SET pos_x=-60, pos_y=-8, pos_z=58, pos_rot=220, groupid=14334 WHERE mobid=17428812;

-- Habetrot's Spawn Point
UPDATE mob_spawn_points SET pos_x=-60, pos_y=-8, pos_z=58, pos_rot=220 WHERE mobname="Habetrot";

-- Wild Onion drops rates are inaccurate
UPDATE mob_droplist SET rate=350 WHERE dropID=1476 AND itemId=4387;

-- Added Dragon Meat and Blood to Dahaks in Mt Z. (5% drop rate)
INSERT INTO mob_droplist VALUES (4524,0,1133,10);	--  Dragon Blood: 1%
INSERT INTO mob_droplist VALUES (4524,0,4272,50);	--  Dragon Meat: 5%
UPDATE mob_groups SET dropid=4524 WHERE groupid=2034;
