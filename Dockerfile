FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip install uv

WORKDIR /app

# Копируем только requirements если есть
COPY pyproject.toml ./

# Устанавливаем зависимости напрямую через pip как запасной вариант
RUN uv pip install -e . || \
    pip install -e . || \
    echo "Trying direct installation..."

COPY . .

CMD ["python", "main.py"]