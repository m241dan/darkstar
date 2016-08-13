#!/bin/bash

DBNAME="dspdb"
DBADMIN="darkstar"
DBPASS="Grc937!"
ZONEIP="216.105.171.45"

DBTODUMP=$DBNAME
SQL="SET group_concat_max_len = 10240;"
SQL="${SQL} SELECT GROUP_CONCAT(table_name separator ' ')"
SQL="${SQL} FROM information_schema.tables WHERE table_schema='${DBTODUMP}'"
SQL="${SQL} AND table_name IN ('account_ip_record','accounts','accounts_banned','auction_house','audit_chat','char_blacklist','char_effects','char_equip','char_exp',"
SQL="${SQL}'char_inventory','char_jobs','char_look','char_merit','char_pet','char_pet_name','char_profile','char_recast','char_skills','char_spells','char_stats',"
SQL="${SQL}'char_storage','char_style','char_vars','char_weapon_skill_points','chars','delivery_box','conquest_system','linkshells','server_variables');"

TBLIST=`mysql -u $DBADMIN -p$DBPASS -AN -e"${SQL}"`

mysqldump -u $DBADMIN -p$DBPASS ${DBTODUMP} ${TBLIST} > sql/melfsql/bak/instant_backup.sql

function run_scripts {
   for f in $1*.sql
     do
        echo -n "Importing $f into the database..."
        mysql $DBNAME -u $DBADMIN -p$DBPASS < $f && echo "Success"
     done

}

run_scripts "sql/"
run_scripts "sql/melfsql/"
run_scripts "sql/melfsql/bak/"
