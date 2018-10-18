#!/bin/bash
DBParams=$1
DBName=$2

function process() {
  echo $1
  echo $2
  sed -e "s/tbname/$1/g" sql/process_template.sql > sql/process_tb.sql
  sed -i -e "s/month-string/$2/g" sql/process_tb.sql
  # eval "mysql $DBParams $DBName < sql/process_tb.sql"
  # rm sql/process_tb.sql
}

eval "mysql $DBParams $DBName < sql/process_reset.sql"
while IFS= read -r -a array
do
  process ${array[0]} ${array[1]}
done
eval "mysql $DBParams $DBName < sql/process_index.sql"
