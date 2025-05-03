FROM docker.n8n.io/n8nio/n8n:latest

# Используем root для установки зависимостей
USER root

# Устанавливаем ffmpeg, curl и Python
RUN apk add --no-cache ffmpeg curl python3 py3-pip

# Создаем виртуальное окружение для Python
RUN python3 -m venv /home/node/.n8n/venv

# Устанавливаем EdgeTTS в виртуальное окружение
RUN /home/node/.n8n/venv/bin/pip install edge-tts

# Устанавливаем правильные права для .n8n
RUN chown -R node:node /home/node/.n8n

# Возвращаемся к пользователю node
USER node

# Указываем явный путь для команды n8n
CMD ["/usr/local/bin/n8n"]
