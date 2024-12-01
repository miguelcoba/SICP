#!/bin/sh
SICP_DIR=/home/mcoba/Code/SICP
docker run -it \
	--platform=linux/amd64 \
	--detach-keys='ctrl-w,w' \
	-v $(pwd):$SICP_DIR \
	-v /Users/mcoba/.ssh:/home/mcoba/.ssh \
	-v /Users/mcoba/.gitconfig:/home/mcoba/.gitconfig \
	-v /Users/mcoba/.gitignore:/home/mcoba/.gitignore \
	-v /Users/mcoba/.emacs.d:/home/mcoba/.emacs.d \
	-w $SICP_DIR \
	docker-emacs
