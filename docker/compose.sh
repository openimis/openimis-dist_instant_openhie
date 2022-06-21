composeFilePath=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
# database parameters
export DB_HOST=db
export DB_PORT=1433
export DB_PASSWORD=IMISuserP@s
export DB_USER=IMISuser
export DB_NAME=IMIS
export ACCEPT_EULA=y

# urls
export NEW_OPENIMIS_HOST=demo.openimis.org # url of openimis
export GATEWAY_PORT=80 # http port for openimis
export GATEWAY_PORT_S=443 # https port for openimis

# github branches to use
export DB_BRANCH=main # branch to get the code of database
export GW_BRANCH=main # branch to get the code of gateway
export BE_BRANCH=main # branch to get the code of BE assembly
export FE_BRANCH=main # branch to get the code of FE assembly
export RESTAPI_BRANCH=main # branch to get the code of the restapi

# build flavours
export RESTAPI_BUILD_FLAVOR=Release # rest API flavours

# docker-compose parameters
export PROJECT_NAME=demo # docker compose project name

#OPENIMIS_BE_CONF_JSON= one-liner json config for the BE (to overright the openimis.json from the BE assembly)
#OPENIMIS_FE_CONF_JSON= one-liner json config for the FE (to overright the openimis.json from the FE assembly)
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
