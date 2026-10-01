#!/bin/bash

docker run --rm -d --name blohg-preview -p 5000:5000 \
  --user "$(id -u):$(id -g)" \
  -v $(pwd):/repo:ro \
  ghcr.io/thermcampos/blohg:0.14-rc2 blohg runserver --repo-path /repo --host 0.0.0.0
