#!/bin/sh

ldaphost="dirapps.aset.psu.edu"
ldapbase="dc=psu,dc=edu"
ldapargs="-LLL -x -h $ldaphost -b $ldapbase"
ldapattr="psMemberOf"
args=$@
today=$(date +%Y%m%d)
fail=0

if [ "${#args}" -eq "0" ]
then
  echo "Usage: umg_backup.sh group [group] ..."
  exit 99
fi

for umg in "$@"
do
  filter="$ldapattr=cn=$umg,$ldapbase uid"
  output="$HOME/backup/umg/$(echo $umg | sed -e 's/\//_/g')-$today"
  ldapsearch $ldapargs $filter | \
    sed -e '/^dn.*/d' -e '/^$/d' -e 's/^uid: \(.*\)/\1/' > $output
  result=$?
  echo -n "Backup of $umg: "
  if [ "$result" -eq "0" ]
  then
    echo "success"
  else
    echo "failure"
    fail=$((fail + 1))
  fi
done

exit $fail
