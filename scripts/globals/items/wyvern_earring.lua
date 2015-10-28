-----------------------------------------
-- ID: 14737
-- Item: Wyvern Earring
-- Item Effect: Haste 5% when SJ = DRG
-----------------------------------------

require( "scripts/globals/status" )

local wyvern_earring = 14737

local function addWyvernEarringEffect(target)
   -- prevent any doubling up
   if( target:getVar( "WyvernEarring" ) == 1 ) then
      return;
   end
   target:addMod( MOD_HASTE_GEAR, 5 );
   target:setVar( "WyvernEarring", 1 );
end

local function remWyvernEarringEffect(target)
   -- prevent any doubling down
   if( target:getVar( "WyvernEarring" ) == 0 ) then
      return;
   end
   target:delMod( MOD_HASTE_GEAR, 5 );
   target:setVar( "WyvernEarring", 0 );
end

function onItemCheck(target)
   printf( "calling script" )
   -- if sj is not drg, remove it, remWyvernEarringEffect()(this function selfchecks to make sure its not removing haste twice)
   if( target:getSubJob() ~= JOB_DRG ) then
      remWyvernEarringEffect( target );
      return;
   end

   -- if its equipped, add, if not remove
   if( target:getEquipID( SLOT_EAR1 ) == wyvern_earring or target:getEquipID( SLOT_EAR2 ) == wyvern_earring ) then
      printf( "called add" )
      addWyvernEarringEffect( target );
   else
      printf( "calluing remove" )
      remWyvernEarringEffect( target );
   end
end
