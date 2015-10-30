# debian-minimal

This Dockerfile is based off of [`debian:jessie`](https://hub.docker.com/_/debian/) and attempts to make the base debian image even smaller by removing things which may not be essential for use in a container, such as documentation and locales. In some cases, removing these may not be desirable - consider the implications of building off this image before use. 

Due to the way that Dockerfiles work, `docker build` is not sufficient - any previously included layers from the source image will still be included. To shrink the image, it will have to be flattened. The simplest way to do this is to build the image from the Dockerfile, run a container with it, export that container and then re-import (and optionally tag it). 
