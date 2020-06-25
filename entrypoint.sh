#!/bin/sh

envsubst < /opt/satis-go/config.template.yaml > /opt/satis-go/config.yaml

if [[ $GITHUB_TOKEN ]]; then
    composer config -g github-oauth.github.com $GITHUB_TOKEN
fi

if [[ -n $GITLAB_TOKEN ]] && [[ -n $GITLAB_HOST ]]; then
    composer config -g "gitlab-token.${GITLAB_HOST}" "${GITLAB_TOKEN}"
    composer config -g gitlab-domains "$GITLAB_HOST" "gitlab.com"
fi

exec "$@"
