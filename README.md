## Docker CLI

* boot2docker

  ```bash
  $ brew install boot2docker
  $ boot2docker up
  $ boot2docker shellinit
  $ boot2docker ip # get IP of VM
  ```

* Hello Docker

  ```bash
  $ docker run busybox echo 'hello Docker!'
  ```

* Run Bash

  ```bash
  $ docker run -it ubuntu /bin/bash
  ```

* Forward ports from container to host

  ```bash
  $ docker run -p 8000:80 atbaker/nginx-example
  ```

* Run a container detached

  ```bash
  $ docker run -d -p 8000:80 atbaker/nginx-example
  $ docker port 3dd0 80 # get where container port is forwarded
  ```

* Stop/start containers

  ```bash
  $ docker ps # list containers
  $ docker ps -a # list all containers, not just currently running
  $ docker stop 3dd0
  $ docker start 3dd0
  ```

* Delete a container

  ```bash
  $ docker stop 3dd0
  $ docker rm 3dd0 # -f to delete a running container
  $ docker rm -f $(docker ps -a -q) # delete all containers
  ```

* Name a container

  ```bash
  $ docker run -d -p 8000:80 --name webserver atbaker/nginx-example
  ```

* Show logs of a container

  ```bash
  $ docker logs webserver
  $ docker logs -f webserver # follow logs
  ```

* Show changes on filesystem since a container was started

  ```bash
  $ docker diff webserver
  ```

* Copy files from container to host

  ```bash
  $ docker cp webserver:/tmp/file.txt .
  ```

* Get lots of information about a container

  ```bash
  $ docker inspect webserver
  ```

## Docker Images

* Show commands previously run to create an image & size of layers

  ```bash
  $ docekr history atbaker/nginx-example
  ```

* Fetch an image from Docekr Hub

  ```bash
  $ docker pull postgres:latest # image_name:tag
  ```

* Save the state of a container as an image

  ```bash
  $ docker commit -m "installed ruby, rack, and added a config.ru" a88c ruby-rack
  ```

* Run the newly created image

  ```bash
  $ docker run -d -p 9292:9292 ruby-rack rackup -o 0.0.0.0
  ```

* Push to Docker Hub

  ```bash
  $ docker tag ruby-rack jrab89/ruby-rack
  $ docker login
  $ docker push jrab89/ruby-rack
  ```