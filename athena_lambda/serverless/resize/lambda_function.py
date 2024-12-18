
import logging
import os


logger = logging.getLogger(__name__)


def handler(event, context):  # noqa
    logger.info("Resize...")
    logger.info(f"APP_GIT_SHA: ${os.environ.get('APP_GIT_SHA')}")
    logger.info(f"APP_VERSION: ${os.environ.get('APP_VERSION')}")
    logger.info("Event: %s", event)
    print(f"Event: {event}")