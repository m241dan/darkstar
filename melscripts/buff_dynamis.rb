#!/usr/bin/ruby

require 'mysql'

  zones = [ 185, 186, 187, 188, 39, 40, 41, 42, 134, 135 ]
  buffs = { 63=>25, # pdefp 25%
            29=>20, # mdef 20
            65=>25, # evap 20
            3=>50 }  # hpp 3
          

begin

  con = Mysql.new 'localhost', 'darkstar', 'Grc937!', 'dspdb'
  poolids = []

  zones.each do |zoneid|
    rs = con.query "SELECT DISTINCT poolid FROM mob_groups WHERE zoneid=#{zoneid};"
    rs.each do |row|
      poolids << row[0].to_i
    end
  end

  poolids = poolids.uniq
  f = File.open( '../sql/melfnamis.sql', 'w' )
  poolids.each do |poolid|
     buffs.each do |key, value|
        f.write "INSERT INTO `mob_pool_mods` VALUES ( #{poolid}, #{key}, #{value},0 );\n"
     end
  end
  f.close
rescue Mysql::Error => e
   puts e.errno
   puts e.error
ensure
   con.close if con
end
