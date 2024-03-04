#!/bin/sh

sleep 10

python manage.py migrate
python manage.py createcachetable
python manage.py collectstatic  --noinput
gunicorn netology_pd_diplom.wsgi:application --bind 127.0.0.1:8000

exec "$@"