
import logging


logger = logging.getLogger(__name__)


def handler(event, context):  # noqa
    logger.info("Logger...")
    logger.info("Event: %s", event)
    print(f"Event: {event}")