FROM python:3.13-slim
LABEL authors="trulselgaaen"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         build-essential \
         curl \
    && rm -rf /var/lib/apt/lists/*

ADD https://astral.sh/uv/install.sh /install.sh
RUN chmod +x /install.sh \
    && UV_INSTALL_DIR=/usr/local/bin UV_NO_MODIFY_PATH=1 sh /install.sh \
    && rm /install.sh

ENV PATH="/usr/local/bin:${PATH}"

WORKDIR /app

COPY pyproject.toml uv.lock ./
RUN uv sync --locked

COPY . .
EXPOSE 5000
CMD ["uv","run","flask", "run", "--host=0.0.0.0", "--port=5000"]
