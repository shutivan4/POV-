FROM node:18-alpine

# Установка зависимостей: ffmpeg, python3, pip, venv
RUN apk add --no-cache ffmpeg curl python3 py3-pip py3-virtualenv

# Создание виртуального окружения Python
RUN python3 -m venv /opt/venv

# Установка edge-tts в виртуальное окружение
RUN /opt/venv/bin/pip install --no-cache-dir edge-tts

# Добавляем venv в PATH, чтобы edge-tts был доступен как команда
ENV PATH="/opt/venv/bin:$PATH"

# Установка n8n
RUN npm install -g n8n

# Создаем директорию для конфигов n8n
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Переход на пользователя node
USER node

# Открываем порт
EXPOSE 5678

# Запуск n8n
CMD ["n8n"]
