#!/bin/sh
docker build \
	--platform=linux/amd64 \
	-t docker-emacs \
	.
