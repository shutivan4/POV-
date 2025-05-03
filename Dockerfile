FROM node:16-alpine

# Устанавливаем ffmpeg, curl и Python
RUN apk add --no-cache ffmpeg curl python3 py3-pip

# Устанавливаем n8n
RUN npm install -g n8n

# Создаем виртуальное окружение для Python
RUN python3 -m venv /home/node/.n8n/venv

# Устанавливаем EdgeTTS в виртуальное окружение
RUN /home/node/.n8n/venv/bin/pip install edge-tts

# Устанавливаем правильные права для .n8n
RUN chown -R node:node /home/node/.n8n

# Указываем переменную окружения для путей
ENV PATH="/home/node/.n8n/node_modules/.bin:$PATH"

# Возвращаемся к пользователю node
USER node

# Указываем команду для запуска n8n
CMD ["n8n"]
