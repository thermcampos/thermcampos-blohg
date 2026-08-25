#!/bin/bash

docker run --rm -d --name blohg-preview -p 3000:5000 \
  --user "$(id -u):$(id -g)" \
  -v $(pwd):/repo:ro \
  rmcampos/blohg:latest blohg runserver --repo-path /repo --host 0.0.0.0
