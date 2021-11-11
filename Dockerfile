FROM alpine:3.14

RUN apk --no-cache --update add openssh bash

RUN mkdir -p /root/.ssh \
	&& chmod 0700 /root/.ssh \
	&& touch /root/.ssh/known_hosts


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
