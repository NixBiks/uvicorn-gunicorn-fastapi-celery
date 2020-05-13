from celery import Celery

celery_app = Celery("worker", include="backend.tasks")

# celery_app.conf.task_routes = {"app.worker.test_celery": "main-queue"}
