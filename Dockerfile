FROM docker.n8n.io/n8nio/n8n:latest

# Используем root для установки зависимостей
USER root

# Устанавливаем ffmpeg, curl и Python
RUN apk add --no-cache ffmpeg curl python3 py3-pip

# Устанавливаем EdgeTTS
RUN pip3 install edge-tts

# Устанавливаем правильные права для .n8n
RUN chown -R node:node /home/node/.n8n

# Возвращаемся к пользователю node
USER node

# Указываем, что n8n будет работать как обычно
CMD ["n8n"]
