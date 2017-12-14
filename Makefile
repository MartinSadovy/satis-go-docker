DOCKER_REPO := koshatul/satis-go-docker

-include artifacts/make/docker/Makefile

artifacts/make/%/Makefile:
	curl -sf https://jmalloc.github.io/makefiles/fetch | bash /dev/stdin $*
