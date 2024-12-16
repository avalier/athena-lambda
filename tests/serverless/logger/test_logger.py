import logging
from typing import Iterator

import pytest

from athena_lambda.serverless.logger.lambda_function import handler
from tests import helpers



logger = logging.getLogger(__name__)


def setup() -> None:
    pass


def teardown() -> None:
    pass


@pytest.fixture
def context() -> Iterator[dict]:
    context: dict = {}
    setup()
    yield context
    teardown()


def test_handler(context: dict) -> None:  # noqa: ARG001
    event = helpers.get_event('event.json')
    handler(event, {})
