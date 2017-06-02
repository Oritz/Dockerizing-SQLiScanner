#!/bin/sh

set -e

FILENAME="sqliscanner-`date +"%Y-%m-%d"`.sql"
docker-compose exec --user postgres postgres pg_dumpall -f /tmp/${FILENAME}
docker-compose exec postgres mv /tmp/${FILENAME} /backup/
