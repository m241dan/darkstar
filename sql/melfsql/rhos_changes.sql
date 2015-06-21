-- Tarasque's Spawn Point
UPDATE mob_spawn_points SET pos_x=124, pos_y=19, pos_z=163, pos_rot=100 WHERE mobname="Tarasque";

-- Updates spell_list.sql so that "Divine Veil"  works (added AOE = 7 for Divine Veil)
-- (These spells also work with SCH's Accession, so SCH needs to check for both AOE=4 and AOE=7)
UPDATE spell_list SET AOE=7 WHERE name="poisona" OR name="paralyna" OR name="silena" OR name="blindna" OR name="cursna" OR name="stona" OR name="erase";

-- Correct droplist for Thread Leeches (in Pashhow Marshlands, zoneID = 109)
-- (poolid = 5133; vial of beastman's blood = 930; dropid = 3472; vial of fiend blood = 924)
DELETE FROM mob_droplist WHERE dropId=3472 AND itemId=924;

-- Adjust Dread Dealing Dredodak's Spawn Point
UPDATE mob_spawn_points SET pos_x=-137, pos_y=7.57, pos_z=146 WHERE mobId=16822462;

-- Buff the Dragon Family (+STR, +Elemental Resistance)
UPDATE mob_family_system SET STR=3, Light=.9, Dark=.75, Fire=.9, Ice=.9, Water=.9, Lightning=.9, Earth=.9, Wind=.9 WHERE family="Dragon";

-- This Rumble Crawler should only spawn in place of Habetrot
-- Gave it a new group in mob_groups and changed it to forced spawn
-- INSERT INTO mob_spawn_mob VALUES (17428812,0,17,1);

-- Habetrot's Spawn Point
UPDATE mob_spawn_points SET pos_x=-60, pos_y=-8, pos_z=58, pos_rot=220 WHERE mobname="Habetrot";