FROM alpine:3.9
MAINTAINER Florian Schwab <me@ydkn.io>

# update system
RUN apk --no-cache --no-progress upgrade

# install avahi
RUN apk --no-cache --no-progress add avahi avahi-tools

# disable d-bus
RUN sed -i 's/.*enable-dbus.*/enable-dbus=no/' /etc/avahi/avahi-daemon.conf

# volumes
VOLUME ["/etc/avahi"]

# default command
CMD ["avahi-daemon"]
