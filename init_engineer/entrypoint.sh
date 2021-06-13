#!/bin/bash

mysql_first_install=false

until echo '\q' | mysql -h"$MARIADB_HOST" -u"$MARIADB_USER" -p"$MARIADB_PASSWORD" $MARIADB_DATABASE; do
  >&2 echo "Mariadb is unavailable - sleeping"
  sleep 1
  mysql_first_install=true
done

if [ "$mysql_first_install" = true ] ; then
  php artisan key:generate
  php artisan migrate --seed
  php artisan passport:install
  php artisan storage:link
fi


php artisan serve --host 0.0.0.0 --port 8000