FROM alpine:latest

RUN apk --no-cache --update add openssh bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
