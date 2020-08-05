#!/bin/sh

ldaphost="dirapps.aset.psu.edu"
ldapbase="dc=psu,dc=edu"
ldapargs="-x -h $ldaphost -b $ldapbase"
ldapattr="psMemberOf"
ldapreturn="dn"
args=$@
today=$(date +%Y%m%d)
fail=0

if [ "${#args}" -eq "0" ]
then
  echo "Usage: umg_check.sh group uid" 
  echo "e.g., umg_check.sh umg/up.ems.vpn tjc181"
  exit 99
fi

umg=$1
uid=$2

filter="(&($ldapattr=cn=$umg,$ldapbase)(uid=$uid))"
ldapsearch $ldapargs $filter | \
  grep -q '^# numResponses: 2' 
#    sed -e '/^dn.*/d' -e '/^$/d' -e 's/^uid: \(.*\)/\1/'
result=$?
if [ "$result" -ne "0" ]
then
  echo "$uid is not a member of $umg"
fi

exit $result
