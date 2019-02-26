#!/bin/sh

ldaphost="dirapps.aset.psu.edu"
ldapbase="dc=psu,dc=edu"
ldapargs="-LLL -x -h $ldaphost -b $ldapbase"
ldapattr="psMemberOf"
umg=$1
filter="$ldapattr=cn=$umg,$ldapbase uid"
today=$(date +%Y%m%d)

if [ "$umg" == "" ]
then
  echo "Usage: umg_backup.sh group"
  exit 99
fi

ldapsearch $ldapargs $filter | egrep -v '^(dn|$)' | cut -d: -f2 | sed -e 's/^ //' > $(echo $umg | sed -e 's/\//_/g')-$today
result=$?

echo -n "Backup of $umg: "
if [ "$result" -eq "0" ]
then
  echo "success"
else
  echo "failure"
fi

exit $result

