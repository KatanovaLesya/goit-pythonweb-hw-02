# Використовуємо офіційний образ Python 3.10
FROM python:3.10

# Встановлюємо змінну оточення для коректної роботи Python у контейнері
ENV PYTHONUNBUFFERED=1

# Створюємо робочу директорію в контейнері
WORKDIR /app

# Копіюємо файли проекту в контейнер
COPY . /app

# Встановлюємо залежності
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Відкриваємо порт 8000 для FastAPI
EXPOSE 8000

# Команда для запуску FastAPI-серверу
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
