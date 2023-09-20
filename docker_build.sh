#!/bin/bash

OUTDIR=./docker_out

mkdir -p $OUTDIR && \
docker build --network=host . -t dropwatch-build && \
docker run -v $OUTDIR:/var/dropwatch/$OUTDIR --network=host --rm dropwatch-build

