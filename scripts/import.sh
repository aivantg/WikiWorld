#!/bin/bash
DBParams=$1
DBName=$2

function process() {
  wget $1 -O "$2.gz"
  gunzip "$2.gz"
  eval "mysql $DBParams $DBName -e 'CREATE TABLE IF NOT EXISTS $2 (src varchar(255), dest varchar(255), type varchar(255), count int);'"
  eval "mysqlimport --local --compress $DBParams --fields-terminated-by='\t' $DBName $2"
  rm $2
}

eval "mysql $DBParams -e 'CREATE DATABASE IF NOT EXISTS $DBName'"
while IFS= read -r -a array
do
  process ${array[0]} ${array[1]}
done
