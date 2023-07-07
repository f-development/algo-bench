export $(cat env/env-${HW_ENV})

docker-compose --project-name f-development-algo-bench "$@"