# Crossbar.io HTTP Bridge node - Docker image

A Docker image setup for a [Crossbar.io](http://crossbar.io/) node running in
[HTTP Bridge mode](http://crossbar.io/docs/HTTP-Bridge-Publisher/).

[![Docker image layers](https://images.microbadger.com/badges/image/joselpa/crossbar-http-bridge.svg)](https://microbadger.com/images/joselpa/crossbar-http-bridge "Get your own image badge on microbadger.com")
[![Docker image version](https://images.microbadger.com/badges/version/joselpa/crossbar-http-bridge.svg)](https://hub.docker.com/r/joselpa/crossbar-http-bridge/)
[![License](http://img.shields.io/:license-gpl3-blue.svg?style=flat-square)](http://www.gnu.org/licenses/gpl-3.0.html)

## Usage

### Build the image

The image can be built with the next command:

```Shell
docker build -t $DOCKERHUB_USER/$IMAGE_NAME:$VERSION .
```

### Create a container and play with it

Once your image is created, you can create a container from it:

```Shell
docker run -t -p 8001:8001 --name crossbar-bridge $DOCKERHUB_USER/$IMAGE_VERSION:$VERSION
```

Or you might prefer to run it in daemon mode, without showing any logging output:

```Shell
docker run -d -p 8001:8001 --name crossbar-bridge $DOCKERHUB_USER/$IMAGE_VERSION:$VERSION
```

Once you are done playing with the node, you can stop it:

```Shell
docker stop crossbar-bridge
```

And next time you want to use it, you just need to trigger this command:

```Shell
docker start crossbar-bridge
```
