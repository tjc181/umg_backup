#!/bin/sh

# Backup directory expiration processing
#
# Walk $BKDIR and remove backups older than $EXPTIME days.
#
# Tom Canich <tom@canich.net>  29 Oct 2014
# Tom Canich <tjc181@psu.edu>  6 Jul 2021

BKDIR=$HOME/backup
NODES="umg"
EXPTIME=30

for node in $NODES
do
    echo
    echo "Expiration processing: $node..."
        find $BKDIR/$node -maxdepth 1 -type f -ctime +$EXPTIME -print -exec rm -r {} \;
    echo "Completed processing: $node"
    echo
done

exit 0

