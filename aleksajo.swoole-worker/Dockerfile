FROM "aleksajo/swoole-server"

RUN apt-get update && apt-get install -y \
    supervisor \
    ffmpeg

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisor/supervisord.conf"]

RUN chmod 775 /var/log/supervisor/ -R

WORKDIR /etc/supervisor/conf.d/
