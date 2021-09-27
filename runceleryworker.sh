#[root@marcrhel82 airflow]# podman container ls
#CONTAINER ID  IMAGE                                       COMMAND               CREATED             STATUS                 PORTS                    NAMES
#178927112ae4  docker.io/bitnami/postgresql:latest         /opt/bitnami/scri...  22 minutes ago      Up 22 minutes ago      0.0.0.0:5432->5432/tcp   postgresql
#3adde21c61e4  docker.io/bitnami/redis:latest              /opt/bitnami/scri...  22 minutes ago      Up 22 minutes ago      0.0.0.0:6379->6379/tcp   redis
#662e70b4a608  docker.io/bitnami/airflow-worker:latest     /opt/bitnami/scri...  About a minute ago  Up About a minute ago  0.0.0.0:40739->8793/tcp  airflow-worker
#b357b4dde0b8  docker.io/bitnami/airflow-scheduler:latest  /opt/bitnami/scri...  5 minutes ago       Up 5 minutes ago                                airflow-scheduler
#bba0aca3c890  docker.io/bitnami/airflow:latest            /opt/bitnami/scri...  12 minutes ago      Up 12 minutes ago      0.0.0.0:8080->8080/tcp   airflow
#podman exec -it bba0aca3c890 airflow celery worker &
#[root@marcrhel82 airflow]# ./airflow.sh
#284a4cf01d1d7b76e6e06bd83f428aa1561aa06a5485427a473a5c4c5474b667
podman exec -it 284a4cf01d1d7b76e6e06bd83f428aa1561aa06a5485427a473a5c4c5474b667 airflow celery worker &
