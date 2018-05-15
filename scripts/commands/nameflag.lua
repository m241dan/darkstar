--[[    
    FLAG_INEVENT        = 0x00000002,
    FLAG_CHOCOBO        = 0x00000040,
    FLAG_WALLHACK       = 0x00000200,
    FLAG_INVITE         = 0x00000800,
    FLAG_ANON           = 0x00001000,
    FLAG_UNKNOWN        = 0x00002000,
    FLAG_AWAY           = 0x00004000,
    FLAG_PLAYONLINE     = 0x00010000,
    FLAG_LINKSHELL      = 0x00020000,
    FLAG_DC             = 0x00040000,
    FLAG_GM             = 0x04000000,
    FLAG_GM_SUPPORT     = 0x04000000,
    FLAG_GM_SENIOR      = 0x05000000,
    FLAG_GM_LEAD        = 0x06000000,
    FLAG_GM_PRODUCER    = 0x07000000,
    FLAG_BAZAAR         = 0x80000000,
--]]
cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player,flag)
   player:setFlag(flag);
end

