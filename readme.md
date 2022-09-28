
# Docker compose set for a Flare Observation node

This is a simple docker compose  that spins up a Flare observation node.

The docker container uses 3 host-mounted volumes:

- database data
- logs
- configurations

The system is started with the *start_observation_node.sh* script that can be customized for additional configuration at startup

## setup instructions

- Create the host mounted folders
    ```
    mkdir -p /tmp/flare/data
    mkdir -p /tmp/flare/logs
    mkdir -p /tmp/flare/conf
    ```
- Configure docker-compose/.env

    ```
    LOCAL_DATA_DIR=/tmp/flare/data
    LOCAL_LOGS_DIR=/tmp/flare/logs
    LOCAL_CONF_DIR=/tmp/flare/conf
    BIND_ADDRESS=.... <- whatever ip address you need 
    ```

- Configure *images/flare_observation/start_observation_node.sh* as needed. Volumes are mapped as 
    ```
    - ${LOCAL_DATA_DIR}:/data/flare-data
    - ${LOCAL_LOGS_DIR}:/data/flare-logs
    - ${LOCAL_CONF_DIR}:/data/flare-conf
    ```
    
- Build the docker image

    ```
    cd docker-compose/
    sudo docker-compose build
    ```

- Run the docker image

    ```
    cd docker-compose/
    sudo docker-compose up -d 
    ``` 


