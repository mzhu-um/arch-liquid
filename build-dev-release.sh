#!/bin/bash 
docker build -f Dockerfile.dev --no-cache --rm -t "mzhu65536/arch-ocaml:latest-dev" .
