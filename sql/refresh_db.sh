#!/bin/bash

for f in *.sql
  do
     echo -n "Importing $f into the database..."
     mysql dspdb -u darkstar -pGrc937! < $f && echo "Success"      
  done

