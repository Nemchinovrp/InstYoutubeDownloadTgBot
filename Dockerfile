FROM python:3.11-slim

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем uv
RUN pip install uv

WORKDIR /app

# Копируем файлы зависимостей
COPY pyproject.toml ./

# Генерируем lock файл если его нет и устанавливаем зависимости
RUN if [ -f "uv.lock" ]; then \
        uv sync --frozen; \
    else \
        uv sync; \
    fi

# Копируем исходный код
COPY . .

CMD ["uv", "run", "python", "main.py"]