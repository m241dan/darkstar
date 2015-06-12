-- Delver, Progenerator, and Wreaker /check -> impossible to gauge
UPDATE mob_pools SET mobType=18 WHERE poolid=966 OR poolid=3204 OR poolid=4382;

-- Craver Family Adjustments
UPDATE mob_groups SET minLevel=35, maxLevel=36 WHERE groupid=512;
UPDATE mob_family_system SET Light=.75, Dark=.75, Fire=.75, Ice=.75, Water=.75, Lightning=.75, Earth=.75, Wind=.75 WHERE family="Craver"; -- Increase Elemental resistance

-- Gorger Family Adjustments
UPDATE mob_groups SET minLevel=35, maxLevel=36 WHERE groupid=485;
UPDATE mob_family_system SET Light=.75, Dark=.75, Fire=.75, Ice=.75, Water=.75, Lightning=.75, Earth=.75, Wind=.75 WHERE family="Gorger"; -- Increase Elemental Resistance

-- Thinker Family Adjustments
UPDATE mob_groups SET minLevel=35, maxLevel=36 WHERE groupid=502;
UPDATE mob_family_system SET Light=.75, Dark=.75, Fire=.75, Ice=.75, Water=.75, Lightning=.75, Earth=.75, Wind=.75 WHERE family="Thinker"; -- Increase Elemental Resistance

-- Create separate droplist for Gigantobugards in Lufaise Meadows (zoneID = 24)
INSERT INTO mob_droplist VALUES (4523,0,1680,10);	--  HQ Bugard Skin: 1%
INSERT INTO mob_droplist VALUES (4523,0,1640,450);	--  Bugard Skin: 45%
INSERT INTO mob_droplist VALUES (4523,0,1622,30);	--  Bugard Tusk: 3%
UPDATE mob_groups SET dropid=4523 WHERE groupid=587;

-- Correct droprates for Gigantobugards in Misreaux Coast (zoneID = 25)
UPDATE mob_droplist SET rate=80 WHERE dropId=1144 AND itemId=1622;	--  Bugard Tusk: 8%
UPDATE mob_droplist SET rate=150 WHERE dropId=1144 AND itemId=1680;	--  HQ Bugard Skin: 15%
UPDATE mob_droplist SET rate=500 WHERE dropId=1144 AND itemId=1640;	--  Bugard Skin: 50%