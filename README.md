# Getting started with Dynatrace for NodeJS developers

This repository contains the instructions to get started with Dynatrace for NodeJS.

There is a simple NodeJS + Express application contained in a single file for demo purposes `index.ts`.

Before starting the application make sure to have a Dynatrace environment already created and a Dynatrace token with permissions to install the One Agent. 
Run this command replacing the dynatrace environment URL (i.e. https://aaaa.live.dynatrace.com) and token

```
export DYNATRACE_ENVIRONMENT_URL=""
export DYNATRACE_API_TOKEN=""
```

To quickly run the container you can use the following command 

```
docker build -t dynatrace-nodejs-demo:latest --build-arg DYNATRACE_ENVIRONMENT_URL="" --build-arg  .
docker run --name production-dt-nodejs-demo dynatrace-nodejs-demo:latest .
```

Once you finish to remove the container and image run the following

```
docker stop production-dt-nodejs-demo
docker rm production-dt-nodejs-demo
docker image rm dynatrace-nodejs-demo:latest

```