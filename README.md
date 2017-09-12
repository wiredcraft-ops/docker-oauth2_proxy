## Build

```
docker build -t boratbot/oauth2_proxy:2.2 --build-arg OAUTH2_PROXY_TAG=v2.2 --build-arg OAUTH2_PROXY_VERSION=2.2.0 --build-arg GO_VERSION=1.8.1 .
```

## Run

```
docker run -d --link YOUR_BACKEND:YOUR_BACKEND -p 4180:4180 boratbot/oauth2_proxy:2.2 -provider=github -client-id="YOUR_CLIENT_ID" -client-secret="YOUR_CLIENT_SECRET" -github-org=Wiredcraft -github-team="core-members,leaders" -http-address="0.0.0.0:4180" -upstream http://YOUR_BACKEND:PORT -cookie-secret=YOUR_COOKIE_SECRET -email-domain='*' -cookie-domain=YOUR_DOMAIN -cookie-secure=true  -request-logging=true -redirect-url="https://YOUR_DOMAIN/oauth2/callback"
```