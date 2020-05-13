FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8-slim
WORKDIR /app

# auto reload app if installed as dev version
ARG INSTALL_DEV
ENV STARTUP=${INSTALL_DEV:+/start-reload.sh}
ENV STARTUP=${STARTUP:-/start.sh}

# point to web app
ENV MODULE_NAME=backend.main

# install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt

# copy content
COPY ./backend backend

# start app
CMD $STARTUP