-- Delver, Progenerator, and Wreaker level increase
UPDATE mob_groups SET minLevel=35, maxLevel=36 WHERE groupid=512 OR groupid=485 OR groupid=502;

-- Make Delver, Progenerator, and Wreaker NMs (check -> impossible to gauge)
UPDATE mob_pools SET mobType=18 WHERE poolid=966 OR poolid=3204 OR poolid=4382;