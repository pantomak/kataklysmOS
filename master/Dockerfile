FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu
		
ARG JMETER_VERSION=5.5
		
RUN apt-get clean && \
apt-get update && \
apt-get -qy install \
wget \
unzip

RUN   mkdir /jmeter \
&& cd /jmeter/ \
&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
&& tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
&& rm apache-jmeter-$JMETER_VERSION.tgz

ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION/
		
ENV PATH $JMETER_HOME/bin:$PATH

ENV HEAP="-Xms24g -Xmx24g -XX:MaxMetaspaceSize=256m"

EXPOSE 60000