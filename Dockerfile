FROM python:3.12-slim

# lint hint:
# docker run --rm -i hadolint/hadolint < Dockerfile
#
# rules:
# https://github.com/hadolint/hadolint?tab=readme-ov-file#rules

WORKDIR /app
COPY . /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends libmagic1=1:5.44-3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

ENV TELEGRAM_TOKEN='your telegram bot token here'
ENV OPENAI_API_KEY='your openai api key here'
ENV SENTRY_DSN='your sentry DSN here'
ENV BOT_NAME='your bot name here'

CMD ["python", "goodsecretarybot.py"]
