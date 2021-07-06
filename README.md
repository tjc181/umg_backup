# umg_backup

umg_backup is a set of shell scripts to manage User Managed Groups (UMG).
These groups are accessible via an LDAP server.

## Usage

sh umg_backup.sh group [group] ...
sh umg_check.sh userName
sh umg_expire.sh 

## Output and return code

The scripts report success or failure to standard out.  The script
returns 0 on success or any positive value on failure.

## Notes
Set BKDIR and NODES in umg_expire.sh
