# scala_vim

a docker file for a useful/portable sbt/scala/vim/ensime dev environment

[Pull `scala_vim` from Docker Hub](https://hub.docker.com/r/rudenoise/scala_vim/)

```bash
docker pull rudenoise/scala_vim
```

```bash
# get a shell
docker run -ti rudenoise/scala_vim /bin/bash

# build local
docker build -t scala_vim:local .

# run
docker run -ti scala_vim:local /bin/bash

# tidy up
docker system prune
```
