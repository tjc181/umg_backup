# umg_backup

umg_backup is a shell script to manage daily backups of User Managed
Groups (UMG).  These groups are accessible via an LDAP server.

## Usage

sh umg_backup.sh [-q] group
                      -----

_-q_  Quiet, don't print anything to standard out.

## Output and return code

The script reports success or failure to standard out unless _-q_
is specified.  The script returns 0 on success or any positive value
on failure.
