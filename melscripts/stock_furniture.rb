#!/usr/bin/ruby

require 'mysql'

begin

  con = Mysql.new 'localhost', 'darkstar', 'Grc937!', 'dspdb'

  rs = con.query 'SELECT item_furnishing.itemid FROM item_furnishing LEFT JOIN item_basic ON item_furnishing.itemid = item_basic.itemid AND item_basic.aH > 0'
  rs.each_hash() do |entry|
    rs = con.query "SELECT COUNT(*) AS count FROM auction_house WHERE itemid = #{entry['itemid']} AND buyer_name IS NULL"
    count = 10 - rs.fetch_row().join().to_i
    until count <= 0
      con.query "INSERT INTO auction_house ( itemid, stack, seller, seller_name, date, price ) VALUES ( #{entry['itemid']}, 0, 0, '', #{Time.now().to_i()}, 500 )"
      count -= 1
    end
  end
rescue Mysql::Error => e
   puts e.errno
   puts e.error
ensure
   con.close if con
end
