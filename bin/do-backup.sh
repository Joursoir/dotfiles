#!/usr/bin/env bash
#
# Dependencies: 'rsync'

backupdir=/mnt/storage/backups
logdir=$backupdir/logs
originserver="user@example.com"
tdate=$(date +%Y%m%d)

# Rsync options:
# a = archive mode (symbolic links, attributes, permissions,
#     ownerships, etc. are preserved in the transfer)
# z = compress file data during the transfer
# v = increase verbosity
# h = output numbers in a human-readable format
#
# A trailing *slash* on the _source_ changes this behavior to avoid
# creating an additional directory level at the _destination_.
mkdir -p $backupdir/$tdate && \
rsync -azvh --progress $originserver:/ \
	--exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} \
	"$backupdir/$tdate" \
	--log-file="$logdir/$tdate.log"
