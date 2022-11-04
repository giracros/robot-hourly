FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

LABEL org.opencontainers.image.authors="danielf@hourly.io"
LABEL name="Docker build for acceptance testing using the robot framework"

# Install
RUN \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y build-essential libssl-dev libffi-dev python3.8
RUN apt-get install -y python3-dev python3-pip
RUN apt-get install -y python3-dev gcc
RUN apt-get install -y firefox
RUN apt-get install -y xvfb zip wget ca-certificates ntpdate libnss3-dev libxss1 libappindicator3-1 libindicator7 \
		gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation
RUN rm -rf /var/lib/apt/lists/*
# Install firefox and firefox driver
RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
RUN tar xvzf geckodriver-*.tar.gz
RUN rm geckodriver-*.tar.gz
RUN mv geckodriver /usr/local/bin
RUN	chmod a+x /usr/local/bin/geckodriver
# Install chrome and chromedriver in one run command to clear build caches for new versions (both version need to match)
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# Install chrome dependencies
RUN apt-get update
RUN apt-get -y install libcurl4 libgbm1
RUN	dpkg -i google-chrome*.deb
RUN	rm google-chrome*.deb
RUN wget -q https://chromedriver.storage.googleapis.com/107.0.5304.62/chromedriver_linux64.zip
RUN	unzip chromedriver_linux64.zip
RUN	rm chromedriver_linux64.zip
RUN	mv chromedriver /usr/local/bin
RUN	chmod +x /usr/local/bin/chromedriver
# Install requirements
COPY requirements.txt .
RUN pip3 install -r requirements.txt

CMD ["/scripts/run_suite.sh"]

