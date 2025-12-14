#!/bin/bash

# .env を読み込む
set -o allexport
source .env
set +o allexport

sudo docker compose exec -T mysql \
  mysql -uroot -p"${DB_ROOT_PASSWORD}" < dump.sql