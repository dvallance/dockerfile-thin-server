#Version: 0.0.1
FROM ubuntu:14.10
MAINTAINER Dave Vallance "davevallance@gmail.com"
ENV REFRESHED_AT 2014-11-19
RUN apt-get -qq update
RUN apt-get -qq -y install ruby ruby-dev build-essential
RUN gem install -q --no-rdoc --no-ri bundler
RUN gem install -q --no-rdoc --no-ri thin
RUN mkdir -p /opt/thin-server
RUN mkdir -p /etc/thin-server
WORKDIR /opt/thin-server
ADD startup.sh /etc/thin-server/startup.sh
ENTRYPOINT ["/bin/bash",  "/etc/thin-server/startup.sh"]
CMD ["-p", "40000", "-e", "production"]
