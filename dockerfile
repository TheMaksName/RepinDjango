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

# Делаем entrypoint исполняемым
RUN chmod +x entrypoint.sh

# Точка входа
ENTRYPOINT ["./entrypoint.sh"]