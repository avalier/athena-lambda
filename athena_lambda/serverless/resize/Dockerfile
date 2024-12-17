ARG PYTHON_VERSION="3.13"
ARG POETRY_VERSION="1.8.3"
ARG APP_GIT_SHA=""
ARG APP_VERSION=""

FROM public.ecr.aws/lambda/python:${PYTHON_VERSION} AS lambda

# Variables & labels #
ENV APP_GIT_SHA=${APP_GIT_SHA}
ENV APP_VERSION=${APP_VERSION}
LABEL git_sha="${APP_GIT_SHA}"
LABEL version="${APP_VERSION}"

# Setup poetry #
RUN pip install --upgrade pip
RUN pip install "poetry==${POETRY_VERSION}"

# Install dependencies #
COPY pyproject.toml ${LAMBDA_TASK_ROOT}
COPY poetry.lock ${LAMBDA_TASK_ROOT}
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev --no-interaction --no-root

# Install application #
COPY athena_lambda ${LAMBDA_TASK_ROOT}

# Entry point #
CMD ["athena_lambda/serverless/resize/lambda_function.handler"]
