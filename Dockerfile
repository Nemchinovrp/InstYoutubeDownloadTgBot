# Используем официальный образ Python
FROM python:3.11-slim

# Устанавливаем uv
RUN pip install uv

# Рабочая директория внутри контейнера
WORKDIR /app

# Копируем pyproject.toml и uv.lock
COPY pyproject.toml uv.lock ./

# Устанавливаем зависимости через uv
RUN uv sync --frozen

# Копируем исходные файлы
COPY . .

# Запускаем бота
CMD ["uv", "run", "python", "main.py"]