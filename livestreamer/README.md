# livestreamer docker image

[Livestreamer](http://docs.livestreamer.io) is a command-line utility that 
pipes video streams from various services into a video player, written in 
Python.

## Example

When running on a host that doesn't have a local video player (for example, 
with Docker for Mac or Windows) use the `player-external-http` option and
provide a pre-defined port to connect to with your player.

```
docker run -it --rm \
  -p 8080:8080 \
  cspicer/livestreamer:1.12.2 \
    --yes-run-as-root \
    --player-external-http \
    --player-external-http-port 8080 \
    twitch.tv/dotamajor best
```
