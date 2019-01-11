#!/usr/bin/env bash
set -e
#set -eoux pipefail

if [[ "$1" == "init" ]]; then
    pipenv run python manage.py migrate
    pipenv run python manage.py collectstatic --no-input
    pipenv run python manage.py compilemessages
elif [[ "$1" == "manage" ]]; then
    shift
    pipenv run python manage.py $@
else
    exec "$@"
fi
