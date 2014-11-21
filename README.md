# dockerfile-thin-server

This repo is an example of how to create a
[Dockerfile](https://docs.docker.com/userguide/dockerimages/#building-an-image-from-a-dockerfile); 
with it you can create an image (Ubuntu 14.04, with Ruby, Rubygems and Thin) and then proceed to run containers from that image. Each container itself will then be running a Rack based appliation (containing a config.ru file) using the [Thin](http://code.macournoyer.com/thin/) web server.

## Usage

Simply clone the repo, build an image, and proceed to run containers from it.

````sh
git clone https://github.com/dvallance/dockerfile-thin-server.git
cd dockerfile-thin-server

# docker needs to be installed

sudo docker build -t thin-server:v1 .
# replace (thin-server:v1) with any image repository name (and optionally tag) you wish

# then build an actual container from that image (mapping your application directory with config.ru
# file to /opt/thin-server)

# from your rack application folder (containing a config.ru file)
cd /myapplication
sudo docker run -d --name my-cool-app -p 3000:9000 -v $PWD:/opt/thin-server thin-server:v1 -p 9000
# here we map the host port 3000 to the container exposed port of 9000, which we know is the running
# port because we supplied it as an option to the thin server (all paramaters after the image(:tag)
# name are passed to the thin server).
#
# we also named the container my-cool-app but change this to whatever you wish.

# your web application should now be availabe at localhost:3000; if not check the logs.
sudo docker logs my-cool-app
````
