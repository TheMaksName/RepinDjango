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
RUN chmod +x /app/entrypoint.sh  # Явно указываем полный путь

COPY . .


# Точка входа
ENTRYPOINT ["./entrypoint.sh"]