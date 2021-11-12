FROM alpine:latest

RUN apk --no-cache --update add openssh bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "-c", "/entrypoint.sh $GITHUB_SHA"]
