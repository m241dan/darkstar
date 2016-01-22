
-- King Behe droprate adjustment
UPDATE `mob_droplist` SET rate=1000 WHERE dropID=1936 AND itemId=13415; -- Pixie
UPDATE `mob_droplist` SET rate=35 WHERE dropID=1936 AND itemId=13566; -- DRing

-- Blue Pondweed on Peryton, Valley Manticore and Raptors
INSERT INTO `mob_droplist` VALUES (4002,0,3343,80);
INSERT INTO `mob_droplist` VALUES (2764,0,3343,80);
INSERT INTO `mob_droplist` VALUES (3679,0,3343,80);

-- Red Pondweed from Adamantoise
UPDATE `mob_droplist` SET rate=500 WHERE dropID=24 AND itemId=3344;

-- Savory Shank from Behemoth
UPDATE `mob_droplist` SET rate=500 WHERE dropID=270 and itemId=3342;

-- Honey Wine from Darters and Bark Tarantula
INSERT INTO `mob_droplist` VALUES (645,0,3339,80);
INSERT INTO `mob_droplist` VALUES (244,0,3339,80);

-- Sweet Tea droprate for nidhogg
UPDATE `mob_drop;ist` SET rate=500 WHERE dropID=918 and itemId=3340;
