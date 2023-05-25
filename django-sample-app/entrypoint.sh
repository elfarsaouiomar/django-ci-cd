#!/bin/bash

set -e

echo "${0}: running migrations."
python manage.py makemigrations --merge
python manage.py migrate --noinput


echo "${0}: running migrations."
python manage.py runserver 0.0.0.0:80

# gunicorn yourapp.wsgi:application \
#     --env DJANGO_SETTINGS_MODULE=yourapp.production_settings \
#     --name yourapp \
#     --bind 0.0.0.0:8000 \
#     --timeout 600 \
#     --workers 4 \
#     --log-level=info \
#     --reload