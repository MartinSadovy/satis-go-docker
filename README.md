# satis-go-docker

This is a fork of [ubc/satis-go-docker](https://github.com/ubc/satis-go-docker) except using my fork of [benschw/satis-go](https://github.com/benschw/satis-go) which supports basic auth and ssh client keys.

```
docker service create \
  --name satis \
  --network swarm \
  --secret source=satis_rsa,target=id_rsa \
  --mount source=satis-data,target=/opt/satis-go/data \
  --label "traefik.enable=true" \
  --label "traefik.backend=satis" \
  --label "traefik.port=8080" \
  --label "traefik.protocol=http" \
  --label "traefik.frontend.rule=Host:composer.example.com" \
  --label "traefik.docker.network=swarm" \
  --env "SATIS_GO_USERNAME=composer" \
  --env "SATIS_GO_PASSWORD=password" \
  --env "SATIS_GO_REPO_NAME=My Composer" \
  --env "SATIS_GO_REPO_HOST=http://composer.example.com" \
  --env "GITHUB_TOKEN=TOKEN" \
  --log-opt max-size=10m \
  --log-opt max-file=3 \
  koshatul/satis-go-docker:latest
```