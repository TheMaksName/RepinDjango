FROM python:3.12-slim

WORKDIR /app

# Устанавливаем зависимости PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY . .
CMD sh -c "\

  echo '--- Применяем миграции ---' && \
  python manage.py migrate && \
  echo '--- Собираем статику ---' && \
  python manage.py collectstatic --noinput && \
  echo '--- Запускаем Gunicorn ---' && \
  gunicorn --bind 0.0.0.0:8000 project.wsgi:application"