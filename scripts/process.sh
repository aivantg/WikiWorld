#!/bin/bash
DBParams=$1
DBName=$2

function process() {
  echo $1
  echo $2
  sed -e "s/tbname/$1/g" process_template.sql > process_tb.sql
  sed -i '' -e "s/month-string/$2/g" process_tb.sql
  eval "mysql $DBParams $DBName < process_tb.sql"
  rm process_tb.sql
}

eval "mysql $DBParams $DBName < process_reset.sql"
while IFS= read -r -a array
do
  process ${array[0]} ${array[1]}
done
eval "mysql $DBParams $DBName < process_index.sql"
