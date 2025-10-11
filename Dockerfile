FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install uv

WORKDIR /app

COPY pyproject.toml uv.lock* ./

# Добавляем отладочные команды
RUN ls -la
RUN cat pyproject.toml || echo "pyproject.toml not found"
RUN uv sync --frozen || uv sync

COPY . .

CMD ["uv", "run", "python", "main.py"]