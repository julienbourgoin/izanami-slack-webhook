# Purpose
This project aim to expose a webhook dedicated to catch [Izanami](https://github.com/MAIF/izanami) events and send slack notifications to log differents occuring events

# Running from sources
This project is based on [adnanh/webhook](https://github.com/adnanh/webhook/) project, which allow to define webhooks with a simple `hooks.json` file

You will then first need the webhook binary and launch the following command :

```shell
./webhook -hooks hooks.json -verbose
```

> Edit the hooks.json file to give the right path to the `izanami-webhook.sh` script

# Build docker

```shell
docker build -t maif/izanami-slack-webhook .
```

# Run docker

```shell
docker run --rm  -p 9091:9000 --name izanami-webhook -e "SLACK_SERVICE_IDENTIFIER=XXXXXXXXX/YYYYYYYYY/ZZZZZZZZZZZZZZZZZZZZZZ" maif/izanami-slack-webhook
```

# Test
```shell
./izanami-webhook.sh "{\"objectsEdited\":[{\"_id\":1147256207334965260,\"domain\":\"Config\",\"key\":\"tt\",\"oldValue\":{\"id\":\"tt\",\"value\":{\"key\":\"fzf\"}},\"payload\":{\"id\":\"tt\",\"value\":{\"key\":\"dczc\"}},\"timestamp\":\"2019-07-05T23:29:29.475\",\"type\":\"CONFIG_UPDATED\"},{\"_id\":1147260536401952781,\"domain\":\"Feature\",\"key\":\"test\",\"oldValue\":{\"activationStrategy\":\"NO_STRATEGY\",\"enabled\":true,\"id\":\"test\",\"parameters\":{}},\"payload\":{\"activationStrategy\":\"NO_STRATEGY\",\"enabled\":false,\"id\":\"test\",\"parameters\":{}},\"timestamp\":\"2019-07-05T23:46:41.605\",\"type\":\"FEATURE_UPDATED\"}]}"
```

# Configure Izanami
Once logged in the [Izanami](https://github.com/MAIF/izanami) UI, go to the webhook menu, and create a new one.

In the Webhook URL field, configure the following : `http://127.0.0.1:9091/hooks/izanami-webhook`

All the matching pattern events will trigger a call to the webhook url

# Environnement variiables

* `SLACK_SERVICE_IDENTIFIER` : The slack hook identifier


