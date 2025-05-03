# Используем официальный образ n8n
FROM docker.n8n.io/n8nio/n8n:latest

# Переходим на пользователя root для установки зависимостей
USER root

# Устанавливаем ffmpeg, curl, Python и pip
RUN apk add --no-cache ffmpeg curl python3 py3-pip

# Создаем виртуальное окружение для Python
RUN python3 -m venv /home/node/.n8n/venv

# Устанавливаем EdgeTTS в виртуальное окружение
RUN /home/node/.n8n/venv/bin/pip install edge-tts

# Устанавливаем правильные права для .n8n
RUN chown -R node:node /home/node/.n8n

# Указываем путь к n8n, если он не доступен
ENV PATH="/home/node/.n8n/node_modules/.bin:$PATH"

# Переходим обратно на пользователя node
USER node

# Указываем команду для запуска n8n
CMD ["n8n"]
