# Build

```shell
docker build -t maif/izanami-slack-webhook .
```

# Run

```shell
docker run --rm  -p 9091:9000 --name izanami-webhook -e "SLACK_SERVICE_IDENTIFIER=XXXXXXXXX/YYYYYYYYY/ZZZZZZZZZZZZZZZZZZZZZZ" maif/izanami-slack-webhook
```

# Test
```shell
./izanami-webhook.sh "{\"objectsEdited\":[{\"_id\":1147256207334965260,\"domain\":\"Config\",\"key\":\"tt\",\"oldValue\":{\"id\":\"tt\",\"value\":{\"key\":\"fzf\"}},\"payload\":{\"id\":\"tt\",\"value\":{\"key\":\"dczc\"}},\"timestamp\":\"2019-07-05T23:29:29.475\",\"type\":\"CONFIG_UPDATED\"},{\"_id\":1147260536401952781,\"domain\":\"Feature\",\"key\":\"test\",\"oldValue\":{\"activationStrategy\":\"NO_STRATEGY\",\"enabled\":true,\"id\":\"test\",\"parameters\":{}},\"payload\":{\"activationStrategy\":\"NO_STRATEGY\",\"enabled\":false,\"id\":\"test\",\"parameters\":{}},\"timestamp\":\"2019-07-05T23:46:41.605\",\"type\":\"FEATURE_UPDATED\"}]}"
```
