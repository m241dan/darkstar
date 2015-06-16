-- Tarasque's Spawn Point
UPDATE mob_spawn_points SET pos_x=124, pos_y=19, pos_z=163, pos_rot=100 WHERE mobname="Tarasque";

-- Habetrot's Spawn Point
UPDATE mob_spawn_points SET pos_x=-60, pos_y=-8, pos_z=56, pos_rot=220 WHERE mobname="Habetrot";

-- Correct droplist for Thread Leeches (in Pashhow Marshlands, zoneID = 109)
-- (poolid = 5133; vial of beastman's blood = 930; dropid = 3472; vial of fiend blood = 924)
DELETE FROM mob_droplist WHERE dropId=3472 AND itemId=924;

-- Adjust Dread Dealing Dredodak's Spawn Point
UPDATE mob_spawn_points SET pos_x=-137, pos_y=7.57, pos_z=146 WHERE mobId=16822462;

-- Buff the Dragon Family (+STR, +Elemental Resistance)
UPDATE mob_family_system SET STR=3, Light=.9, Dark=.75, Fire=.9, Ice=.9, Water=.9, Lightning=.9, Earth=.9, Wind=.9 WHERE family="Dragon";