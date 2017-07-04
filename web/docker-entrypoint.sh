#!/bin/sh

set -e

python3 manage.py makemigrations scanner
python3 manage.py migrate

# Please use `docker-compose exec web python3 manage.py createsuperuser`
# su -m myuser -c "python3 manage.py createsuperuser"

nohup python /data/sqlmap-1.1/sqlmapapi.py -s -p 8775 >> /data/logs/sqlmap.log 2>&1 &
nohup su -m myuser -c "python3 manage.py celery worker --loglevel=info" >> /data/logs/celery.log  2>&1 &

/usr/bin/gunicorn SQLiScanner.wsgi:application -w 2 -b :8000

exec "$@"
