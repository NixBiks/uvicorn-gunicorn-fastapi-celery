FROM python:3.8.2-slim-buster
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 PYTHONUNBUFFERED=1
WORKDIR /app

# auto reload app if installed as dev version
ARG INSTALL_DEV
RUN if [ ! -z "$INSTALL_DEV" ]; then pip install watchdog[watchmedo]; fi
ENV STARTUP=${INSTALL_DEV:+./start-worker-reload.sh}
ENV STARTUP=${STARTUP:-./start-worker.sh}

# install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt

# copy content
COPY ./start-worker.sh .
COPY ./start-worker-reload.sh .
COPY ./backend backend

#start worker
CMD $STARTUP