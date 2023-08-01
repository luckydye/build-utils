docker buildx build ./docker/ubuntu -t luckydye/build-utils:latest
docker build test/node -t test/node
docker run -it --entrypoint="bash" test/node
