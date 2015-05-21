repository = docker-croner-paas

default: build

build:
				 docker build -t $(repository) .

run:  build
				 docker run -p 3000:3000 -it -v /var/run/docker.sock:/var/run/docker.sock $(repository)
