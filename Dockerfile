FROM node:18-alpine

# Устанавливаем необходимые пакеты
RUN apk add --no-cache ffmpeg curl python3 py3-pip

# Устанавливаем n8n глобально
RUN npm install -g n8n

# Устанавливаем EdgeTTS
RUN pip3 install edge-tts

# Создаем рабочую директорию и устанавливаем права
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Переходим на пользователя node
USER node

# Открываем порт n8n
EXPOSE 5678

# Команда запуска
CMD ["n8n"]
