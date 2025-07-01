# Используем базовый образ Alpine
FROM alpine:3.22.0
ENV TZ="Europe/Moscow"
# Устанавливаем необходимые пакеты и удаляем ненужное, cоздаем директорию для приложения
RUN apk update && \
    apk add php-cli php-openssl tzdata && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /app/data

# Копируем приложение
COPY src/hello.php /app/hello.php

ENTRYPOINT ["/usr/bin/php", "/app/hello.php"]