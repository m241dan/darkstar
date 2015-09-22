-- wyrms in general have WAY too much charisma
UPDATE mob_family_system SET CHR=6 WHERE family='Wyrm';

-- fafnir + nidhogg 
UPDATE mob_family_system SET Lightning=1.15, Water=1.15 WHERE familyid=260 or familyid=263; -- fix faf and nid elemental reses
UPDATE mob_family_system SET Fire=.875, Ice=.875 WHERE familyid=260 or familyid=263; -- ibid
UPDATE mob_pool_mods SET value=30 WHERE poolid=1280; -- nerf fafnir regain
UPDATE mob_pool_mods SET value=50 WHERE poolid=2840; -- nerf nidhogg regain

-- INSERT INTO `mob_pool_mods` VALUES (1280,1,100,0); -- fafnir needs like 100 more defense (leave commented due to being inserts that are already inserted)
-- INSERT INTO `mob_pool_mods` VALUES (2840,1,100,0); -- nidhogg needs the same (ibid)
UPDATE mob_family_system SET ATT=2, DEF=2, ACC=2, EVA=2 WHERE familyid=263; -- buff nidhogg att, def, eva and acc

-- adamantoise changes
UPDATE mob_family_system SET DEF=1 WHERE family='Adamantoise'; -- buff ada's family def

-- sky god genbu
UPDATE mob_family_system SET DEF=1, Dark=1, Light=1, Earth=.5, Water=.5, Lightning=1.25, Fire=1, Wind=1, Ice=1 WHERE family='Genbu'; -- buffing genbu

-- sky god seiryu
UPDATE mob_family_system SET Lightning=1, Earth=.75, Wind=.5, Fire=.5, Ice=1.25, Dark=1, Light=1, Water=1 WHERE family='Seiryu';
UPDATE mob_pools SET immunity=528 WHERE name='Seiryu'; -- immunity to sleep silence and elegy

-- sky god byakko
UPDATE mob_family_system SET Lightning=.8125, Dark=1.25, Light=.5, Ice=1, Earth=1, Wind=1, Water=1, Fire=1 WHERE family='Byakko';

-- sky god suzaku
UPDATE mob_family_system SET Light=1, Dark=1, Fire=.5, Ice=.75, Water=1.25, Lightning=1, Earth=1, Wind=.85 WHERE family='Suzaku';

-- sky god kirin
UPDATE mob_family_system SET DEF=1, EVA=1, Ice=.9, Lightning=.9, Fire=.9, Earth=.5, Dark=.9, Light=.9, Fire=.9, Wind=1.25 WHERE family='Kirin'; -- buffing kirin
UPDATE mob_family_system SET mob_family_system.INT=4, VIT=2, MND=4 WHERE family='Kirin';

-- sky god general
UPDATE mob_pools SET immunity=17 WHERE name='Kirin' OR name='Byakko' OR name='Suzaku' OR name='Genbu'; -- immunity to sleep and silence
UPDATE mob_family_system SET DEF=2, EVA=2 WHERE family='Seiryu' or family='Byakko' or family='Suzaku'; -- buffing gods

-- angel skin on Chary
INSERT INTO `mob_droplist` VALUES (512,0,1312,1000);

-- updated drop pools for Machai tigers in Kuftal Tunnels
INSERT INTO `mob_droplist` VALUES (5500,0,2518,35);
INSERT INTO `mob_droplist` VALUES (5500,0,5668,70);

-- sky elements
UPDATE `mob_groups` SET dropid=5505 WHERE groupid=6941; -- lightning elemental
UPDATE `mob_groups` SET dropid=5502 WHERE groupid=6932; -- ice elemental
UPDATE `mob_groups` SET dropid=5508 WHERE groupid=6924; -- dark elemental
UPDATE `mob_groups` SET dropid=5507 WHERE groupid=6935; -- light elemental
UPDATE `mob_groups` SET dropid=5504 WHERE groupid=6926; -- earth elemental
UPDATE `mob_groups` SET dropid=5503 WHERE groupid=6922; -- air elemental
UPDATE `mob_groups` SET dropid=5506 WHERE groupid=6942; -- water elemental
UPDATE `mob_groups` SET dropid=5501 WHERE groupid=6928; -- fire elemental

-- fire elemental droplist
INSERT INTO `mob_droplist` VALUES (5501,0,4104,1000);
INSERT INTO `mob_droplist` VALUES (5501,0,4104,400);
INSERT INTO `mob_droplist` VALUES (5501,0,4104,150);
INSERT INTO `mob_droplist` VALUES (5501,0,786,150); -- ruby

-- ice elemental droplist
INSERT INTO `mob_droplist` VALUES (5502,0,4105,1000);
INSERT INTO `mob_droplist` VALUES (5502,0,4105,400);
INSERT INTO `mob_droplist` VALUES (5502,0,4105,150);
INSERT INTO `mob_droplist` VALUES (5502,0,787,150); -- diamond

-- air elemental droplist
INSERT INTO `mob_droplist` VALUES (5503,0,4106,1000);
INSERT INTO `mob_droplist` VALUES (5503,0,4106,400);
INSERT INTO `mob_droplist` VALUES (5503,0,4106,150);
INSERT INTO `mob_droplist` VALUES (5503,0,785,150); -- emerald

-- earth elemental droplist
INSERT INTO `mob_droplist` VALUES (5504,0,4107,1000);
INSERT INTO `mob_droplist` VALUES (5504,0,4107,400);
INSERT INTO `mob_droplist` VALUES (5504,0,4107,150);
INSERT INTO `mob_droplist` VALUES (5504,0,789,150); -- topaz

-- lightning elemental droplist
INSERT INTO `mob_droplist` VALUES (5505,0,4108,1000);
INSERT INTO `mob_droplist` VALUES (5505,0,4108,400);
INSERT INTO `mob_droplist` VALUES (5505,0,4108,150);
INSERT INTO `mob_droplist` VALUES (5505,0,804,150); -- spinel

-- water elemental droplist
INSERT INTO `mob_droplist` VALUES (5506,0,4109,1000);
INSERT INTO `mob_droplist` VALUES (5506,0,4109,400);
INSERT INTO `mob_droplist` VALUES (5506,0,4109,150);
INSERT INTO `mob_droplist` VALUES (5506,0,794,150); -- sapphire

-- light elemental droplist
INSERT INTO `mob_droplist` VALUES (5507,0,4110,1000);
INSERT INTO `mob_droplist` VALUES (5507,0,4110,400);
INSERT INTO `mob_droplist` VALUES (5507,0,4110,150);
INSERT INTO `mob_droplist` VALUES (5507,0,813,150); -- angelstone

-- dark elemental droplist
INSERT INTO `mob_droplist` VALUES (5508,0,4111,1000);
INSERT INTO `mob_droplist` VALUES (5508,0,4111,400);
INSERT INTO `mob_droplist` VALUES (5508,0,4111,150);
INSERT INTO `mob_droplist` VALUES (5508,0,812,150); -- deathstone
