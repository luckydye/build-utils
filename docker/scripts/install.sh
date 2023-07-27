#!/bin/bash

rtx install

for path in $(rtx bin-paths); do \
  ln -s $path/* /usr/local/bin/ 2>/dev/null || true; \
done
