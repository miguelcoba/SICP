FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y git mit-scheme emacs-nox
RUN useradd -rm -d /home/mcoba -s /bin/bash -G sudo mcoba
USER mcoba
WORKDIR /home/mcoba
ENTRYPOINT ["emacs"]
