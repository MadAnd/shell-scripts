#!/bin/sh

if [ $# -eq 0 ]; then
	echo "USAGE: $(basename $0) db-name [db-user-name [db-user-password]]"
	exit 1
fi

DB_NAME=$1
DB_USER=${2:-"$DB_NAME"}
DB_PASS=${3:-"$DB_USER"}

mysql -u root << EOF
	CREATE DATABASE \`$DB_NAME\`;
	GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
	FLUSH PRIVILEGES;
EOF

exit 0
