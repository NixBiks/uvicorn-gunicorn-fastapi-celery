from .core.celery_app import celery_app


@celery_app.task
def number_of_tokens(text: str) -> int:
    return len(text.split())
