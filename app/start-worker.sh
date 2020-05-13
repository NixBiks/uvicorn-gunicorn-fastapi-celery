#! /usr/bin/env sh

# Start celery
exec celery worker --app=backend.core.celery_app.celery_app --loglevel=info --concurrency=1