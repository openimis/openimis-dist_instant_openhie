#!/bin/bash

docker exec openimis_db /sqls/create_database.sh
docker exec openimis_db /sqls/create_user_db.sh
