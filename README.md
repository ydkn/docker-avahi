# Docker image for Avahi

## Get configuration from image

```bash
docker create ydkn/avahi:latest
docker cp $(docker ps -ql):/etc/avahi .
docker rm $(docker ps -ql)
```

## Modify configuration
Edit `avahi-daemon.conf` to you needs.
Edit the services in the `services` directory to you needs.

# Start the container

```bash
docker run -d --restart always --net=host -v $(pwd)/avahi:/etc/avahi ydkn/avahi:latest
```
