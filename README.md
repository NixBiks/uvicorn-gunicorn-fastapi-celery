## FastAPI application with Celery workers

This project is a boilerplate for using [FastAPI](https://fastapi.tiangolo.com/) application with [Celery](http://www.celeryproject.org/) workers (using [RabbitMQ](https://www.rabbitmq.com/) as default message broker).

It is a [dockerized](https://www.docker.com/), building on top of the production-ready [uvicorn-gunicorn-fastapi](https://github.com/tiangolo/uvicorn-gunicorn-docker) image by [Sebastian Ramirez](https://github.com/tiangolo) (author of FastAPI). 

### Configurations

See [uvicorn-gunicorn-fastapi](https://github.com/tiangolo/uvicorn-gunicorn-docker).


#### Local development

The `docker-compose.override.yml` file sets `INSTALL_DEV=1` flags as build args which allows both worker and web application to auto-reload on local file changes. You'd remove that file when deploying to a server. 