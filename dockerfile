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
    dos2unix /app/entrypoint.sh

COPY . .


# Точка входа
ENTRYPOINT ["./entrypoint.sh"]