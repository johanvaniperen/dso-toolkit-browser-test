# Dockerfile for Robot Framework
# This image contains Python, poetry and the robotframework package
FROM python:3.12-slim-bookworm

ENV TZ Europe/Amsterdam
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# curl is universally used and not having it results in silent errors
RUN apt-get install -y --no-install-recommends curl

# Tkinter is not part of the standard lib, but e.g. the RF Dialogs library depends on it
RUN apt-get install -y --no-install-recommends python3-tk

# GNU Compiler Collection to be able to build from source
RUN apt-get install -y --no-install-recommends gcc

# nodejs
RUN apt install -y nodejs
RUN apt install -y npm

# dependencies for Playwright rendering engines
RUN npx playwright install-deps

# virtual screen buffer to allow Playwright screenshots
RUN apt-get install -y --no-install-recommends xvfb

#  tmp files cleanup
RUN	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install poetry and the export plugin
RUN pip install poetry

RUN poetry config virtualenvs.create false

# Copy the pyproject.toml and poetry.lock file to be able to install dependencies using poetry
COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock

RUN poetry install --only main

# Browser library needs to initialize node dependencies before it can be used
RUN poetry run rfbrowser init

ENTRYPOINT /bin/sh
