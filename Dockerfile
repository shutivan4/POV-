FROM node:18-alpine

# Установка системных зависимостей
RUN apk add --no-cache \
    ffmpeg \
    curl \
    python3 \
    py3-pip \
    py3-virtualenv \
    bash \
    build-base \
    libffi-dev \
    openssl-dev \
    py3-wheel

# Создание и активация виртуального окружения Python
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Установка edge-tts
RUN pip install --no-cache-dir edge-tts

# Установка n8n
RUN npm install -g n8n

# Создание директории для конфигов n8n
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Используем непривилегированного пользователя
USER node

# Рабочая директория
WORKDIR /home/node

# Устанавливаем переменные среды для работы с Cloud API
ENV AZURE_REGION=<your-azure-region>  # Пример: eastus
ENV AZURE_KEY=<your-azure-key>  # Пример: cbcabcdef12345...

# Открываем порт
EXPOSE 5678

# Запуск n8n
CMD ["n8n"]
