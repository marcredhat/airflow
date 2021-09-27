podman system prune --all --force && podman rmi --all
#podman pod rm 887de3e80943


podman  network create airflow-tier
 podman volume create postgresql_data



podman volume create postgresql_data
podman run -d --name postgresql -p 5432:5432 \
  -e POSTGRESQL_USERNAME=bn_airflow \
  -e POSTGRESQL_PASSWORD=bitnami1 \
  -e POSTGRESQL_DATABASE=bitnami_airflow \
  --net airflow-tier \
  --volume postgresql_data:/bitnami/postgresql \
  bitnami/postgresql:latest

podman volume create --name redis_data
podman  run -dt --rm -p 6379:6379 --publish-all  --name redis  -e ALLOW_EMPTY_PASSWORD=yes  --net airflow-tier --volume redis_data:/bitnami bitnami/redis:latest

podman volume create airflow_data
podman run -d --publish-all  --name airflow -p 8080:8080 \
  -e AIRFLOW_FERNET_KEY=46BKJoQYlPPOexq0OhDZnIlNepKFf87WFwLbfzqDDho= \
  -e AIRFLOW_SECRET_KEY=a25mQ1FHTUh3MnFRSk5KMEIyVVU2YmN0VGRyYTVXY08= \
  -e AIRFLOW_EXECUTOR=CeleryExecutor \
  -e AIRFLOW_DATABASE_NAME=bitnami_airflow \
  -e AIRFLOW_DATABASE_USERNAME=bn_airflow \
  -e AIRFLOW_DATABASE_PASSWORD=bitnami1 \
  -e AIRFLOW_LOAD_EXAMPLES=yes \
  -e AIRFLOW_PASSWORD=bitnami123 \
  -e AIRFLOW_USERNAME=user \
  -e AIRFLOW_EMAIL=user@example.com \
  --net airflow-tier \
  --volume airflow_data:/bitnami \
  bitnami/airflow:latest


podman volume create airflow_scheduler_data
podman run -d --name airflow-scheduler \
  -e AIRFLOW_FERNET_KEY=46BKJoQYlPPOexq0OhDZnIlNepKFf87WFwLbfzqDDho= \
  -e AIRFLOW_SECRET_KEY=a25mQ1FHTUh3MnFRSk5KMEIyVVU2YmN0VGRyYTVXY08= \
  -e AIRFLOW_EXECUTOR=CeleryExecutor \
  -e AIRFLOW_DATABASE_NAME=bitnami_airflow \
  -e AIRFLOW_DATABASE_USERNAME=bn_airflow \
  -e AIRFLOW_DATABASE_PASSWORD=bitnami1 \
  -e AIRFLOW_LOAD_EXAMPLES=yes \
  -e AIRFLOW_WEBSERVER_HOST=127.0.0.1 \
  --net airflow-tier \
  --volume airflow_scheduler_data:/bitnami \
  bitnami/airflow-scheduler:latest





podman volume create airflow_worker_data
podman run -d --publish-all --name airflow-worker \
  -e AIRFLOW_FERNET_KEY=46BKJoQYlPPOexq0OhDZnIlNepKFf87WFwLbfzqDDho= \
  -e AIRFLOW_SECRET_KEY=a25mQ1FHTUh3MnFRSk5KMEIyVVU2YmN0VGRyYTVXY08= \
  -e AIRFLOW_EXECUTOR=CeleryExecutor \
  -e AIRFLOW_DATABASE_NAME=bitnami_airflow \
  -e AIRFLOW_DATABASE_USERNAME=bn_airflow \
  -e AIRFLOW_DATABASE_PASSWORD=bitnami1 \
  -e AIRFLOW_WEBSERVER_HOST=127.0.0.1 \
  --net airflow-tier \
  --volume airflow_worker_data:/bitnami \
  bitnami/airflow-worker:latest

