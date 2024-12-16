FROM public.ecr.aws/lambda/python:3.13 as lambda_base

# Setup poetry #
RUN pip install --upgrade pip
ENV POETRY_VERSION=1.8.3
RUN pip install "poetry==$POETRY_VERSION"

# Install dependencies #
COPY pyproject.toml ${LAMBDA_TASK_ROOT}
COPY poetry.lock ${LAMBDA_TASK_ROOT}
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev --no-interaction --no-root

# Install application #
COPY athena_lambda ${LAMBDA_TASK_ROOT}/athena_lambda

# Entry point #
CMD ["athena_lambda/serverless/logger/lambda_function.handler"]
