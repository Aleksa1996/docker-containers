FROM alpine:3.10

RUN apk --update upgrade && \
    apk add --update inotify-tools && \
    apk add --update curl && \
    apk add --update bash && \
    rm -rf /var/cache/apk/*

ADD init.sh /init.sh

RUN chmod 750 /init.sh

WORKDIR /tmp

CMD ["/bin/bash", "/init.sh"]

# ENTRYPOINT ["tail", "-f", "/dev/null"]
# docker build -t aleksajo/swoole-watcher .
