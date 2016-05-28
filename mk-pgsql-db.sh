#!/bin/sh

if [ $# -eq 0 ]; then
	echo "USAGE: $(basename $0) db-name [db-user-name [db-user-password]]"
	exit 1
fi

DB_NAME=$1
DB_USER=${2:-"$DB_NAME"}
DB_PASS=${3:-"$DB_USER"}

cat <<EOF | psql postgres
CREATE ROLE "$DB_USER" LOGIN
  PASSWORD '$DB_PASS'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

CREATE DATABASE "$DB_NAME"
  WITH OWNER = "$DB_USER"
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;

EOF

exit 0
