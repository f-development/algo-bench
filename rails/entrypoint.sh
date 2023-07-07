#!/bin/bash

./wait.sh $DB_HOST:$DB_PORT -t 600 -- ./start_docker.sh