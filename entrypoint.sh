#! /usr/bin/env bash

export DJANGO_SETTINGS_MODULE=run24hr.settings

cd $APPLICATION_ROOT\run24hr/
while ! nc -z db 5432; do sleep 1; done
pipenv run python manage.py migrate
pipenv run python manage.py collectstatic --noinput
pipenv run uwsgi --ini $APPLICATION_ROOT\run24hrs.ini

