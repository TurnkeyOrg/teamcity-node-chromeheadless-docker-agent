########################################################################
# Based on the official TeamCity Agent image with Nodejs added on top. #
########################################################################

FROM jetbrains/teamcity-agent:latest

#ARG BUILD_DATE
#ARG VCS_REF

#MAINTAINER hgulamabbass
LABEL maintainer="hgulamabbass"
#LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-url="https://github.com/TurnkeyOrg/teamcity-node-chromeheadless-docker-agent"
#LABEL org.label-schema.vcs-ref=$VCS_REF

RUN apt-get update && \
	apt-get install -y build-essential && \
	curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
	apt-get install -y nodejs && \
	apt-get install -y man && \
	apt-get install -y wget && \
	apt-get install -y dbus-x11 && \
	apt-get install -y xvfb && \
	apt-get clean all

# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

RUN apt-get install -y firefox && \
	apt-get clean all

ENV DISPLAY=:99
ENV CHROME_BIN /usr/bin/google-chrome

COPY docker_opts.sh /services/docker_opts.sh