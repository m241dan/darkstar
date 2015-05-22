#!/usr/bin/ruby

require 'mysql'

begin

  con = Mysql.new 'localhost', 'darkstar', 'Grc937!', 'dspdb'

  rs = con.query 'SELECT item_furnishing.itemid FROM item_furnishing LEFT JOIN item_basic ON item_furnishing.itemid = item_basic.itemid AND item_basic.aH > 0'
  rs.each_hash() do |entry|
    con.query "DELETE FROM auction_house WHERE itemid=#{entry['itemid']}"
  end
rescue Mysql::Error => e
   puts e.errno
   puts e.error
ensure
   con.close if con
end
