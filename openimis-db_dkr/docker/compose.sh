composeFilePath=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

export DB_SQL_SCRIPT=https://raw.githubusercontent.com/openimis/database_ms_sqlserver/main/Empty%20databases/openIMIS_ONLINE.sql
export ACCEPT_EULA=Y
export DB_HOST=openimis_db
export DB_PORT=1433
export DB_NAME=imis
export DB_USER=sa
export DB_PASSWORD=imis
export NEW_OPENIMIS_HOST=
export LEGACY_OPENIMIS_HOST=frontend




if [ "$1" == "init" ]; then
    # execute other setup scripts or commands here
    # ...
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml up -d
    echo "Waiting for the database to start"
    sleep 30
    docker exec openimis_db ./create_database.sh
elif [ "$1" == "up" ]; then
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml up -d
    echo "Waiting for the database to start"
    sleep 30
    docker exec openimis_db "$composeFilePath"/sqls/mysql/create_database.sh
elif [ "$1" == "down" ]; then
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml stop
elif [ "$1" == "destroy" ]; then
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml down -v
else
    echo "Valid options are: init, up, down, or destroy"
fi
