-- wyrms in general have WAY too much charisma
UPDATE mob_family_system SET CHR=7 WHERE family='Wyrm';

-- fafnir + nidhogg 
UPDATE mob_family_system SET Lightning=1.15, Water=1.15 WHERE familyid=260 or familyid=263; -- fix faf and nid elemental reses
UPDATE mob_family_system SET Fire=.875, Ice=.875 WHERE familyid=260 or familyid=263; -- ibid
UPDATE mob_pool_mods SET value=30 WHERE poolid=1280; -- nerf fafnir regain
UPDATE mob_pool_mods SET value=50 WHERE poolid=2840; -- nerf nidhogg regain

-- INSERT INTO `mob_pool_mods` VALUES (1280,1,100,0); -- fafnir needs like 100 more defense (leave commented due to being inserts that are already inserted)
-- INSERT INTO `mob_pool_mods` VALUES (2840,1,100,0); -- nidhogg needs the same (ibid)
UPDATE mob_family_system SET ATT=2, DEF=2, ACC=2, EVA=2 WHERE familyid=263; -- buff nidhogg att, def, eva and acc

-- tiamat family
UPDATE mob_family_system SET Ice=.75, Lightning=1.20, CHR=7, mob_family_system.INT=4, ATT=1, DEF=4, EVA=4, AGI=5 WHERE familyid=393;

INSERT INTO `mob_pool_mods` VALUES ( 3916, 12, 100, 1 );
INSERT INTO `mob_pool_mods` VALUES ( 3916, 244, 80, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 3916, 254, 200, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 3916, 240, 50, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 3916, 31, 30, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 3916, 250, -50, 0 );


-- jorm
UPDATE mob_family_system SET Wind=.85, Ice=.75, mob_family_system.INT=4, EVA=4, AGI=5 WHERE familyid=392;
INSERT INTO `mob_pool_mods` VALUES ( 2156, 12, 1, 1 );
INSERT INTO `mob_pool_mods` VALUES ( 2156, 242, 200, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 2156, 244, 80, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 2156, 254, 200, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 2156, 240, 50, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 2156, 31, 30, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 2156, 250, -50, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 2156, 257, 200, 0 );
INSERT INTO `mob_pool_mods` VALUES ( 2156, 247, 200, 0 );

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
INSERT INTO `mob_droplist` VALUES (5500,0,2518,150);
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

-- dynamis coin
UPDATE `mob_droplist` SET rate=15 WHERE itemid=1450 OR itemid=1453 or itemid=1456;

-- eraser
UPDATE `mob_groups` SET HP=4600, MP=2000, spawntype=128, respawntime=0, minLevel=81, maxLevel=83 WHERE groupid=6927;
UPDATE `mob_pools` SET mobType=2 WHERE name='Eraser';

-- skahnowa
UPDATE `mob_groups` SET HP=4600, spawntype=128, respawntime=0, minLevel=81, maxLevel=83 WHERE groupid=6865;
UPDATE `mob_pools` SET mobType=2, cmbDelay=200 WHERE name='Skahnowa';

-- Weapon Skills

-- ascetics fury 
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=11; 
-- stringing pummel 
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=12;
-- mandalic stab
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=27;
-- mordent rhyme
UPDATE `weapon_skills` SET skilllevel=250 WHERE weaponskillID=28;
-- pyrrhic kleos
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=29;
-- death blossom
UPDATE `weapon_skills` SET skilllevel=260 WHERE weaponskillID=44;
-- atonement
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=45;
-- expiacion
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=46;
-- primal rend
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=74;
-- King's Justice
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=90;
-- Insurgency
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=106;
-- Drakesbane
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=122;
-- Blade: Kamu
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=138;
-- Tachi: Rana
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=154;
-- Mystic boon
UPDATE `weapon_skills` SET skilllevel=266 WHERE weaponskillID=171;
-- Vidohunir
UPDATE `weapon_skills` SET skilllevel=250 WHERE weaponskillID=186;
-- Garland of Bliss
UPDATE `weapon_skills` SET skilllevel=260 WHERE weaponskillID=187;
-- Omniscience
UPDATE `weapon_skills` SET skilllevel=240 WHERE weaponskillID=188;
-- Trueflight
UPDATE `weapon_skills` SET skilllevel=285 WHERE weaponskillID=217;
-- Leaden Salute
UPDATE `weapon_skills` SET skilllevel=260 WHERE weaponskillID=218;

-- RespawnTimer Adjustments
UPDATE `mob_groups` SET respawnTime=300 WHERE respawnTime>300 AND respawnTime<=1201;

-- Tiamat new droppool
DELETE FROM `mob_droplist` WHERE dropId=3522;
INSERT INTO `mob_droplist` VALUES( 3522, 0, 860, 150); -- behemoth hide
INSERT INTO `mob_droplist` VALUES( 3522, 0, 1703, 300 ); -- kunwu ores
INSERT INTO `mob_droplist` VALUES( 3522, 0, 1703, 250 );
INSERT INTO `mob_droplist` VALUES( 3522, 0, 1703, 200 );
INSERT INTO `mob_droplist` VALUES( 3522, 0, 1703, 150 );
INSERT INTO `mob_droplist` VALUES( 3522, 0, 1816, 300 ); -- wyrm bone
INSERT INTO `mob_droplist` VALUES( 3522, 0, 14869, 300 ); -- noritsune kote
INSERT INTO `mob_droplist` VALUES( 3522, 0, 15322, 200 ); -- herald's gaiters
INSERT INTO `mob_droplist` VALUES( 3522, 0, 11379, 200 ); -- hermes sandals
INSERT INTO `mob_droplist` VALUES( 3522, 0, 19213, 150 ); -- white tathhlum
INSERT INTO `mob_droplist` VALUES( 3522, 0, 14162, 100 ); -- agrona's leggings
INSERT INTO `mob_droplist` VALUES( 3522, 0, 15705, 100 ); -- ataractic solea

-- Jormungand new droppool
DELETE FROM `mob_droplist` WHERE dropId=1852;
INSERT INTO `mob_droplist` VALUES( 1852, 0, 860, 150 ); -- behemoth hide
INSERT INTO `mob_droplist` VALUES( 1852, 0, 647, 300 ); -- molybdenum ore
INSERT INTO `mob_droplist` VALUES( 1852, 0, 647, 250 );
INSERT INTO `mob_droplist` VALUES( 1852, 0, 647, 200 );
INSERT INTO `mob_droplist` VALUES( 1852, 0, 647, 150 );
INSERT INTO `mob_droplist` VALUES( 1852, 0, 1771, 300 ); -- Dragon Bone
INSERT INTO `mob_droplist` VALUES( 1852, 0, 17586, 300 ); -- mercurial pole
INSERT INTO `mob_droplist` VALUES( 1852, 0, 16158, 190 ); -- gnadbod's helm
INSERT INTO `mob_droplist` VALUES( 1852, 0, 16159, 190 ); -- zha'gos barbut
INSERT INTO `mob_droplist` VALUES( 1852, 0, 16160, 190 ); -- Ree's Headgear
INSERT INTO `mob_droplist` VALUES( 1852, 0, 19212, 150 ); -- black tathlum
INSERT INTO `mob_droplist` VALUES( 1852, 0, 11502, 150 ); -- acubens helm
INSERT INTO `mob_droplist` VALUES( 1852, 0, 11483, 150 ); -- gnole crown

-- changing chopsuey chuckys stuff droprates
UPDATE `mob_droplist` SET rate=250 WHERE itemId=1118 or itemId=1121 or itemID=1980;

-- cactuar root 100%
UPDATE `mob_droplist` SET rate=1000 WHERE itemId=1592;

-- nightmare vase
DELETE FROM `mob_droplist` WHERE dropId=2458 AND itemId=942;
INSERT INTO `mob_droplist` VALUES (2458,0,942,1000);
INSERT INTO `mob_droplist` VALUES (2458,0,942,500);


