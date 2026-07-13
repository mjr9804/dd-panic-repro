# dd-panic-repro

A minimal reproduction of a panic that occurs when running ddtrace + uwsgi.

## Pre-requisites

1. [uv](https://docs.astral.sh/uv/getting-started/installation/) if running locally

2. [Docker](https://docs.docker.com/manuals/#application-development) if running in a container

## Running locally

1. Start the server

```sh
# Install dependencies
uv sync
# Run development server
uv run uwsgi --ini uwsgi.ini
```

## Running in a Docker container

```sh
# Build and start the server
docker compose up -d
# Tail the container log
docker logs -f dd-panic-repro
```

## Reproducing the panic

Browse to http://127.0.0.1:80, which should load a default Django landing page. The uwsgi server is configured with a single worker that reloads after 1 request. Once it reloads, the panic will occur.

If the panic doesn't occur after the first request, reloading the page a couple of times should eventually trigger it.
