docker buildx build ./docker/debian -t luckydye/build-utils:debian --push
docker buildx build ./docker/alpine -t luckydye/build-utils:alpine --push
