#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env file not found!"
    exit 1
fi

# Check if required PANEL_ADMIN variables are set
if [ -z "$PANEL_ADMIN_NAME" ] || [ -z "$PANEL_ADMIN_EMAIL" ] || [ -z "$PANEL_ADMIN_PASSWORD" ]; then
    echo "PANEL_ADMIN variables not set in .env file!"
    exit 1
fi

echo "Creating admin user with the following details:"
echo "Name: $PANEL_ADMIN_NAME"
echo "First Name: $PANEL_ADMIN_FIRST_NAME"
echo "Last Name: $PANEL_ADMIN_LAST_NAME"
echo "Email: $PANEL_ADMIN_EMAIL"
echo "Password: [HIDDEN]"


# うまく動作しない場合、以下のコマンドに直接値を入力して試してみてください
docker exec pterodactyl-panel php artisan p:user:make \
  --username="$PANEL_ADMIN_NAME" \
  --name-first="$PANEL_ADMIN_FIRST_NAME" \
  --name-last="$PANEL_ADMIN_LAST_NAME" \
  --email="$PANEL_ADMIN_EMAIL" \
  --password="$PANEL_ADMIN_PASSWORD" \
  --admin=1

echo "Admin user created successfully!"
