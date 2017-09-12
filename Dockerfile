FROM gliderlabs/alpine:3.2

ARG OAUTH2_PROXY_TAG=v2.2
ARG OAUTH2_PROXY_VERSION=2.2.0
ARG GO_VERSION=1.8.1
ENV OAUTH2_PROXY_TAG=${OAUTH2_PROXY_TAG} OAUTH2_PROXY_VERSION=${OAUTH2_PROXY_VERSION} GO_VERSION=${GO_VERSION}

RUN apk --update add curl

RUN curl -sL -o oauth2_proxy.tar.gz \
    "https://github.com/bitly/oauth2_proxy/releases/download/$OAUTH2_PROXY_TAG/oauth2_proxy-$OAUTH2_PROXY_VERSION.linux-amd64.go$GO_VERSION.tar.gz" \
  && tar xzvf oauth2_proxy.tar.gz \
  && mv oauth2_proxy-$OAUTH2_PROXY_VERSION.linux-amd64.go$GO_VERSION/oauth2_proxy /bin/ \
  && chmod +x /bin/oauth2_proxy \
  && rm -r oauth2_proxy*

ENTRYPOINT ["oauth2_proxy"]