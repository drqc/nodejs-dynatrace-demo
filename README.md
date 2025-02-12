# Getting started with Dynatrace for NodeJS developers

This repository contains the instructions to get started with Dynatrace for NodeJS.

There is a simple NodeJS + Express application contained in a single file for demo purposes `index.ts`.

Before starting the application make sure to have a Dynatrace environment already created and a Dynatrace token with permissions to install the One Agent. 
Run this command replacing the dynatrace environment URL (i.e. https://aaaa.live.dynatrace.com) and token with the following scopes. 

- Read settings
- Write settings
- Read entities
- Installer download
- Access problem and event feed, metrics, and topology
- Create ActiveGate tokens

```
export DYNATRACE_ENVIRONMENT_URL=""
export DYNATRACE_TOKEN=""
export DYNATRACE_ENVIRONMENT_ID=""
```

To quickly run the container you can use the following command 

```
echo $DYNATRACE_TOKEN | docker login $DYNATRACE_ENVIRONMENT_URL -u $DYNATRACE_ENVIRONMENT_ID --password-stdin
sed -i "s|DTenvironmentURL|$DYNATRACE_ENVIRONMENT_URL|g" ./Dockerfile
docker build -t dynatrace-nodejs-demo:latest .
docker run --name production-dt-nodejs-demo -p 3000:3000 dynatrace-nodejs-demo:latest
```

Once you finish to remove the container and image run the following

```
docker stop production-dt-nodejs-demo
docker rm production-dt-nodejs-demo
docker image rm dynatrace-nodejs-demo:latest

```