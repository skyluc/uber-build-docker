# Environement to run uber-build
#
# TODO:
# * install needed software
# * install ssk key (private ?  :/ ) - links -- USING PUBLIC GIT URL
# * install .credentials - links
# * git clone uberbuild - in ONBUILD?
# * create validation .bashrc script (check credentials/ssh-keys are avaialable)
#
# maybe in diffferent docker config
# * git clone skyluc/config

FROM ubuntu:14.04
MAINTAINER Luc Bourlier <luc.bourlier@typesafe.com>

# rename the machine
RUN echo "uber-build" > /etc/host

# install software
ENV TERM linux
RUN apt-get update && apt-get install -y git

# creates the user
RUN useradd -m -s /bin/bash uber

# create folder structure
RUN mkdir -p /home/uber/dev /home/uber/opt

RUN chown -R uber:uber /home/uber 

USER uber
WORKDIR /home/uber/dev
RUN yes "yes" | git clone http://github.com/scala-ide/uber-build

WORKDIR /home/uber/dev/uber-build
ENTRYPOINT [ "/bin/bash" ]
