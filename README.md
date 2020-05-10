# TeamCity Docker Agent Supporting NodeJs (teamcity-node-docker-agent)and headless chrome and Firefox for running tests

A docker agent for TeamCity that supports NodeJs and headless chrome and Firefox for running tests

Based on the official TeamCity Agent image with Nodejs added on top.

**Based on:**
https://hub.docker.com/r/jetbrains/teamcity-agent/

## Build
```docker build -t teamcity-node-docker-agent .```

## Example command for running
This will start it up with docker build support and remove the container when you exit.

**Remember to replace Server address that will point it to your TeamCity server.**
  
```docker run -it -e SERVER_URL="<Server address>" --privileged -e DOCKER_IN_DOCKER=start -e DOCKER_OPTS="--insecure-registry 10.0.0.10:5000 --insecure-registry http://10.0.0.10:5000" -e AGENT_NAME="DockerNodejs-Agent" --name teamcity-node-docker-agent --rm teamcity-node-docker-agent```

**Note:**
The two ```--insecure-registry``` Is only needed if communicating with a [insecure registry](https://docs.docker.com/registry/).
