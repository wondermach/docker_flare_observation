FROM ubuntu:20.04

ARG FLARE_VERSION=1.7.1803
ARG GO_VERSION=1.19.1

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Rome"

RUN  apt-get -y update && \
 apt-get -y install git && \
 apt-get -y install gcc && \
 apt-get -y install g++ && \
 apt-get -y install jq  && \
 apt-get -y install curl && \
 apt-get -y install rsync 


WORKDIR /tmp
RUN echo "Preparing go environment ${GO_VERSION}"  && \
    curl -OL https://go.dev/dl/go"$GO_VERSION".linux-amd64.tar.gz && \
    tar -C /usr/local -xvf go"$GO_VERSION".linux-amd64.tar.gz && \
    echo "export GOROOT=/usr/local/go" >> /etc/profile && \
    echo "export PATH=$GOROOT/bin:$PATH" >> /etc/profile 

ENV GOROOT="/usr/local/go"
ENV PATH="$GOROOT/bin:$PATH"

RUN go version && \
    echo "Preparing github local repository "$FLARE_VERSION && \
    mkdir -p /data/flare_v.${FLARE_VERSION} && \
    ln -s /data/flare_v.${FLARE_VERSION}/ /data/flare

WORKDIR "/data/flare"
RUN git clone https://github.com/flare-foundation/go-flare.git
WORKDIR "/data/flare/go-flare/avalanchego"
RUN ./scripts/build.sh
WORKDIR /data
ADD start_observation_node.sh ./
RUN chmod 770 ./start_observation_node.sh

EXPOSE 9650

CMD ["./start_observation_node.sh"]