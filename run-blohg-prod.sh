#!/bin/bash

docker run --rm -d --name blohg -p 3000:8000 -v ~/rmcampos-blohg:/repo:ro rmcampos/blohg:latest
