# Dockerfiles


```
docker volume create --name aws
docker volume create --name projects
docker volume create --name ssh

docker run -it --rm \
  -w /root/projects \
  -v ssh:/root/.ssh \
  -v aws:/root/.aws \
  -v projects:/root/projects \
  -v /Users:/Users \
  -v /var/run/docker.sock:/var/run/docker.sock  \
  jamesbrennan/dev
```

Based on [cspicer/dockerfiles](https://github.com/cspicer/dockerfiles).
