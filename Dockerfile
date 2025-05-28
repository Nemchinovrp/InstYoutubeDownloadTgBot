# Используем официальный образ Python
FROM python:3.11-slim

# Установка uv
RUN pip install uv

# Рабочая директория
WORKDIR /app

# Копируем только requirements.txt, чтобы воспользоваться кэшированием слоёв
COPY requirements.txt .

# Устанавливаем зависимости через uv
RUN uv pip install -r requirements.txt --python 3.11

# Копируем весь код
COPY . .

# Запуск бота
CMD ["uv", "run", "python", "main.py"]