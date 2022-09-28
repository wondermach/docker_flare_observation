FROM ubuntu:20.04

ARG FLARE_VERSION=0.6.3
ARG GO_VERSION=1.19.1

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Rome"

RUN apt-get -y update
RUN apt-get -y install git
RUN apt-get -y install gcc
RUN apt-get -y install g++
RUN apt-get -y install jq 
RUN apt-get -y install curl 
RUN apt-get -y install rsync

RUN echo "Preparing go environment ${GO_VERSION}"
WORKDIR /tmp
RUN curl -OL https://go.dev/dl/go"$GO_VERSION".linux-amd64.tar.gz
RUN tar -C /usr/local -xvf go"$GO_VERSION".linux-amd64.tar.gz 
RUN echo "export GOROOT=/usr/local/go" >> /etc/profile 
RUN echo "export PATH=$GOROOT/bin:$PATH" >> /etc/profile 

ENV GOROOT="/usr/local/go"
ENV PATH="$GOROOT/bin:$PATH"

RUN go version


RUN echo "Preparing github local repository "$FLARE_VERSION

RUN mkdir -p /data/flare_v.${FLARE_VERSION}
RUN ln -s /data/flare_v.${FLARE_VERSION}/ /data/flare
WORKDIR "/data/flare"
RUN git clone https://github.com/flare-foundation/go-flare.git
WORKDIR "/data/flare/go-flare/avalanchego"
RUN ./scripts/build.sh
WORKDIR /data
ADD env.properties ./
ADD start_observation_node.sh ./
RUN chmod 770 ./start_observation_node.sh

EXPOSE 9650

CMD ["./start_observation_node.sh"]