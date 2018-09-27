FROM alpine:3.8
MAINTAINER Florian Schwab <me@ydkn.de>

# install avahi
RUN apk add --no-cache avahi avahi-tools

# disable d-bus
RUN sed -i 's/.*enable-dbus.*/enable-dbus=no/' /etc/avahi/avahi-daemon.conf

# set entrypoint
ENTRYPOINT ["avahi-daemon"]
