FROM acntech/jre:1.8.0_101
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


RUN apt-get update && apt-get -y upgrade

RUN wget --no-cookies --no-check-certificate "http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.6/bin/apache-tomcat-8.5.6.tar.gz" -O /tmp/tomcat.tar.gz
RUN mkdir /opt/tomcat && tar -xzvf /tmp/tomcat.tar.gz -C /opt/tomcat/ && ln -s /opt/tomcat/apache-tomcat-8.5.6/ /opt/tomcat/default && rm -f /tmp/tomcat.tar.gz


ENV CATALINA_HOME /opt/tomcat/default
ENV PATH $PATH:$CATALINA_HOME/bin


EXPOSE 8080


CMD ["catalina.sh", "run"]