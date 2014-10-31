# drone-docker

Docker built image is hosted here: https://registry.hub.docker.com/u/state/drone/

Drone CI docker image.

The image is based on Fedora base image. It has docker, git, wget tools and
obviously drone preinstall.

## Configuration

Configuration is done using environment variables or by passing a config file
via `--config drone.toml`.

See https://github.com/drone/drone for more details.

## Running

```bash
docker run \
  -e DRONE_SERVER_PORT=:80 \
  -p 80:80 state/drone
```

