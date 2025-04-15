FROM python:3.12-slim as builder

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .

# Устанавливаем зависимости глобально
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы
COPY . .

# Финальный этап
FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /app .

# Настройка окружения
ENV PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=registration.settings

# Сборка статики и запуск
RUN python manage.py collectstatic --noinput

CMD ["gunicorn", "registration.wsgi:application", "--bind", "0.0.0.0:8000"]