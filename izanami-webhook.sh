#!/bin/bash

function post_to_slack () {
  # format message as a code block ```${msg}```
  SLACK_MESSAGE="\`\`\`$1\`\`\`"
  SLACK_URL=https://hooks.slack.com/services/$SLACK_SERVICE_IDENTIFIER
  SLACK_ICON=':izanami:'
  curl -s -X POST --data "payload={\"username\": \"Izanami\", \"icon_emoji\": \"${SLACK_ICON}\", \"text\": \"${SLACK_MESSAGE}\"}" ${SLACK_URL}
}

_processFeatureObject()
{
    object=$(echo $1  | base64 --decode)
	type=$(echo $object  | jq -r '.type')
	key=$(echo $object | jq -r '.key')
    enabled=$(echo $object | jq -r '.payload.enabled')
    post_to_slack "$type : $key $enabled"
}

_processConfigObject()
{
	object=$(echo $1  | base64 --decode)
    echo 'Config object'
}

_processEditedObject()
{
	object=$(echo $1  | base64 --decode)
	domain=$(echo $object | jq -r '.domain')
	echo $domain

    case "$domain" in
        "Feature")
            _processFeatureObject $1
            ;;

        "Config")
            _processConfigObject $1
            ;;
		*)
            echo "Objet non reconnu : $domain"
    esac
}

for object in $(echo $1 | jq -r '.objectsEdited[] | @base64'); do
   _processEditedObject $object
done

