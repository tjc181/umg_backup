#!/bin/sh

ldaphost="dirapps.aset.psu.edu"
ldapbase="dc=psu,dc=edu"
ldapargs="-x -h $ldaphost -b $ldapbase"
ldapattr="psMemberOf"
today=$(date +%Y%m%d)

if [ "$1" == "" ] || [ "$2" == "" ]
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
result=$?

exit $result
