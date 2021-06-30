composeFilePath=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
export DB_PORT=1433
export DB_NAME=imis
export DB_USER=sa
export DB_PASSWORD=Imisimis!
export NEW_OPENIMIS_HOST=openimis-hapi.swisstph-mis.ch
export LEGACY_OPENIMIS_HOST=frontend
export DB_SQL_SCRIPT=https://github.com/openimis/database_ms_sqlserver/blob/master/Demo%20database/openIMIS_demo_ONLINE.sql?raw=true
export ACCEPT_EULA=Y
export DB_HOST=openimis_db
export BE_BRANCH=develop
export FE_BRANCH=develop
export GW_BRANCH=develop
if [ "$1" == "init" ]; then
    # execute other setup scripts or commands here
    # ...
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml up -d
elif [ "$1" == "up" ]; then
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml up -d
elif [ "$1" == "down" ]; then
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml stop
elif [ "$1" == "destroy" ]; then
    docker-compose -f "$composeFilePath"/docker-compose.yml  -f "$composeFilePath"/docker-compose.config.yml down -v
else
    echo "Valid options are: init, up, down, or destroy"
fi
