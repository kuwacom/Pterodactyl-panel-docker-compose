#!/bin/bash

# .env を読み込む
set -o allexport
source .env
set +o allexport

sudo docker compose exec mysql \
  mysqldump -uroot -p"${DB_ROOT_PASSWORD}" --all-databases > dump.sql