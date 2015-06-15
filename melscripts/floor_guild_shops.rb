#!/usr/bin/ruby

require 'mysql'

begin

  con = Mysql.new 'localhost', 'darkstar', 'Grc937!', 'dspdb'
  rs = con.query "SELECT guildid, itemid, min_price, max_price FROM guild_shops;"

  f = File.open( '../sql/guild_shops_change.sql', 'w' )

  rs.each_hash() do |row|  
     if( ( row['max_price'] = row['max_price'].to_i() * 0.33 ) < row['min_price'].to_i() ) 
        row['max_price'] = row['min_price'].to_i()
     end
     f.write "UPDATE guild_shops SET max_price=#{row['max_price'].to_i()} WHERE guildid=#{row['guildid'].to_i()} and itemid=#{row['itemid'].to_i()};\n"
  end
  f.close
rescue Mysql::Error => e
   puts e.errno
   puts e.error
ensure
   con.close if con
end
