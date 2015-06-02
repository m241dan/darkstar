-- Tarasque spawn point
UPDATE mob_spawn_points SET pos_x=124, pos_y=19, pos_z=163, pos_rot=100 WHERE mobId=17617164;

-- Correct droplist for Thread Leeches (in Pashhow Marshlands, zoneID = 109)
-- (poolid = 5133; vial of beastman's blood = 930; dropid = 3472; vial of fiend blood = 924)
DELETE FROM mob_droplist WHERE dropId=3472 AND itemId=924;