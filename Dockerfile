FROM python:3.14-trixie

COPY --from=ghcr.io/astral-sh/uv:0.11.26 /uv /bin/

WORKDIR /app

RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync

COPY . .

EXPOSE 80

CMD ["uv", "run", "uwsgi", "--ini", "uwsgi.ini"]
