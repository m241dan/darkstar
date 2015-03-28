#!/usr/bin/ruby

require 'mysql'

begin

  con = Mysql.new 'localhost', 'darkstar', 'Grc937!', 'dspdb'
  rs = con.query 'SELECT itemID, level FROM item_armor WHERE level <= 60'
  
  item_array = []
  rs.each_hash do |row|
    name_rs = con.query "SELECT name FROM item_basic WHERE itemID = #{row['itemID']} AND aH > 0"
    if( name_rs.num_rows() < 1 ) then next end
    hash_entry = Hash.new
    hash_entry['itemID'] = row['itemID'].to_i()
    hash_entry['level']  = row['level'].to_i()
    hash_entry['name']   = name_rs.fetch_row.join()
    if( hash_entry['name'].start_with?( 'judge' ) ) then next end
    if( hash_entry['name'].end_with?( '+1' ) )
      hash_entry['cost'] = hash_entry['level'] * 150
    elsif( hash_entry['name'].end_with?( '+2' ) )
      hash_entry['cost'] = hash_entry['level']* 200
    else
      hash_entry['cost'] = hash_entry['level'] * 100
    end
    item_array << hash_entry
  end

  item_array.each() do |entry|
    rs = con.query "SELECT COUNT(*) AS count FROM auction_house WHERE itemid = '#{entry['itemId']}' AND buyer_name IS NULL"
    count = 10 - rs.fetch_row()[1].to_i
    until count <= 0
      con.query "INSERT INTO auction_house ( itemid, stack, seller, seller_name, date, price ) VALUES ( #{entry['itemID']}, 0, 0, '', #{Time.now().to_i()}, #{entry['cost']} )"
      count -= 1
    end
  end
rescue Mysql::Error => e
   puts e.errno
   puts e.error
ensure
   con.close if con
end
