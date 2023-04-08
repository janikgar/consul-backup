#!/usr/bin/env sh

cd /tmp

consul snapshot save backup_$(date -u "+%Y_%m_%d").snap.gz
consul snapshot save -stale backup_stale_$(date -u "+%Y_%m_%d").snap.gz
mc cp backup_$(date -u "+%Y_%m_%d").snap.gz syno/consul-backups
mc cp backup_stale_$(date -u "+%Y_%m_%d").snap.gz syno/consul-backups
