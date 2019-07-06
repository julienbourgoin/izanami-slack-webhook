FROM debian:buster-slim

RUN apt update && apt install -y jq curl webhook

#COPY webhook /webhook
COPY entrypoint.sh /entrypoint.sh
COPY hooks.json /hooks.json
COPY izanami-webhook.sh /izanami-webhook.sh

ENTRYPOINT ["/entrypoint.sh"]
