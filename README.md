# Dockerfiles


```
docker volume create --name aws
docker volume create --name projects
docker volume create --name emacs
docker volume create --name ssh

docker run -it --rm \
  -v ssh:/root/.ssh \
  -v aws:/root/.aws \
  -v projects:/root/projects \
  -v /Users:/Users \
  -v /var/run/docker.sock:/var/run/docker.sock  \
  jamesbrennan/dev
```
