FROM python:3.12-slim

WORKDIR /app



# Устанавливаем зависимости PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY entrypoint.sh .
RUN chmod 755 /app/entrypoint.sh && \
    sed -i 's/\r$//' /app/entrypoint.sh  # Аналог dos2unix

COPY . .
CMD sh -c "\
  echo '--- Проверка подключения к PostgreSQL ---' && \
  until pg_isready -h $DB_HOST -p $DB_PORT; do \
    echo 'Ждём PostgreSQL...'; \
    sleep 2; \
  done && \
  echo '--- Применяем миграции ---' && \
  python manage.py migrate && \
  echo '--- Собираем статику ---' && \
  python manage.py collectstatic --noinput && \
  echo '--- Запускаем Gunicorn ---' && \
  gunicorn --bind 0.0.0.0:8000 project.wsgi:application"