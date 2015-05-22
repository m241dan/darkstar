#!/usr/bin/ruby

require 'mysql'

begin

  con = Mysql.new 'localhost', 'darkstar', 'Grc937!', 'dspdb'
  rs = con.query 'SELECT itemID, level FROM item_armor WHERE level <= 60'
  
  item_array = []
  rs.each_hash do |row|
    name_rs = con.query "SELECT name, stackSize, BaseSell FROM item_basic WHERE itemID = #{row['itemID']} AND aH > 0 LIMIT 1"
    if( name_rs.num_rows() < 1 ) then next end
    n_row = name_rs.fetch_row()
    hash_entry = Hash.new
    hash_entry['itemID'] = row['itemID'].to_i()
    hash_entry['level']  = row['level'].to_i()
    hash_entry['name']   = n_row[0]
    if( hash_entry['name'].start_with?( 'judge' ) ) then next end

    #calculate AH value
    if( hash_entry['name'].end_with?( '+1' ) )
      ah_price = ( hash_entry['level'] * 150 ) * ( 1 / n_row[1].to_i() )
    elsif( hash_entry['name'].end_with?( '+2' ) )
      ah_price = ( hash_entry['level']* 200 ) * ( 1 / n_row[1].to_i() )
    else
      ah_price = ( hash_entry['level'] * 100 ) * ( 1 / n_row[1].to_i() )
    end

    if( ah_price > n_row[2].to_i() ) then next end

    hash_entry['cost'] = ah_price < 1 ? ah_price : 1
    item_array << hash_entry
  end

  rs = con.query 'SELECT item_furnishing.itemid FROM item_furnishing LEFT JOIN item_basic ON item_furnishing.itemid = item_basic.itemid AND item_basic.aH > 0'
  rs.each_hash() do |row|
     hash_entry = Hash.new()
     hash_entry['itemID'] = row['itemid'].to_i()
     hash_entry['cost'] = 500
     item_array << hash_entry
  end

  item_array.each() do |entry|
     con.query "UPDATE item_basic SET BaseSell=#{entry['cost']} WHERE itemid=#{entry['itemID']}"
  end
rescue Mysql::Error => e
   puts e.errno
   puts e.error
ensure
   con.close if con
end
