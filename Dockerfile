FROM alpine:3.8
MAINTAINER Florian Schwab <me@ydkn.de>

# update system
RUN apk --no-cache --no-progress upgrade

# install avahi
RUN apk --no-cache --no-progress add runit tini avahi avahi-tools

# disable d-bus
RUN sed -i 's/.*enable-dbus.*/enable-dbus=no/' /etc/avahi/avahi-daemon.conf

# copy scripts
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY service /etc/service

# volumes
VOLUME ["/etc/avahi"]

# entrypoint
ENTRYPOINT ["tini", "--", "docker-entrypoint.sh"]

# default command
CMD ["runsvdir", "/etc/service"]
