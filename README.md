# instant-openIMIS

This repository uses the deploy script from the instant OpenHIE to group services together,
see [instant OpenHIE - create packages](https://openhie.github.io/instant/docs/how-to/creating-packages).

To start the project, clone the repository and in the main directory run \
`./deploy.sh init core openimis-db_dkr openimis-dist_dkr -c="./openimis-db_dkr" -c="./openimis-dist_dkr"` \
To clean up the project you'd use `destroy` instead of `init`. The commands `up` and `down` known from docker-compose are also allowed. 
