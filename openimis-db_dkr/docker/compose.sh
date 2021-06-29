composeFilePath=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

if [ "$1" == "init" ]; then
    # execute other setup scripts or commands here
    # ...

    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml up -d
elif [ "$1" == "up" ]; then
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml up -d
elif [ "$1" == "down" ]; then
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml stop
elif [ "$1" == "destroy" ]; then
    docker-compose -f "$composeFilePath"/docker-compose.yml -f "$composeFilePath"/docker-compose.config.yml down -v
else
    echo "Valid options are: init, up, down, or destroy"
fi
