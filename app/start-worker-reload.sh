#! /usr/bin/env sh

# Start celery with auto reload
exec watchmedo auto-restart \
  --directory=./ \
  --pattern=*.py \
  --recursive \
  -- ./start-worker.sh