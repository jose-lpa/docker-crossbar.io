# Crossbar.io HTTP Bridge node - Docker image

A Docker image setup for a [Crossbar.io](http://crossbar.io/) node running in
[HTTP Bridge mode](http://crossbar.io/docs/HTTP-Bridge-Publisher/).

[![License](http://img.shields.io/:license-gpl3-blue.svg?style=flat-square)](http://www.gnu.org/licenses/gpl-3.0.html)

## Usage

### Build the image

The image can be built with the next command:

```bash
docker build -t $DOCKERHUB_USER/$IMAGE_NAME:$VERSION .
```

### Create a container and play with it

Once your image is created, you can create a container from it:

```bash
docker run -t -p 8001:8001 --name crossbar-bridge $DOCKERHUB_USER/$IMAGE_VERSION:$VERSION
```

Or you might prefer to run it in daemon mode, without showing any logging output:

```bash
docker run -d -p 8001:8001 --name crossbar-bridge $DOCKERHUB_USER/$IMAGE_VERSION:$VERSION
```

Once you are done playing with the node, you can stop it:

```bash
docker stop crossbar-bridge
```

And next time you want to use it, you just need to trigger this command:

```bash
docker start crossbar-bridge
```
