FROM acntech/jre:1.8.0_101-alpine
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


ENV TOMCAT_VERSION 8.5.6
ENV CATALINA_HOME /opt/tomcat/default
ENV PATH $PATH:${CATALINA_HOME}/bin


RUN apk update && apk upgrade && apk add gnupg

RUN wget --no-cookies --no-check-certificate "https://www.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" -O /tmp/tomcat.tar.gz
RUN wget --no-cookies --no-check-certificate "https://www.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz.asc" -O /tmp/tomcat.tar.gz.asc
RUN wget --no-cookies --no-check-certificate "https://www.apache.org/dist/tomcat/tomcat-8/KEYS" -O /tmp/tomcat.KEYS

RUN gpg --import /tmp/tomcat.KEYS && gpg --batch --verify /tmp/tomcat.tar.gz.asc /tmp/tomcat.tar.gz
RUN mkdir -p /opt/tomcat && tar -xzvf /tmp/tomcat.tar.gz -C /opt/tomcat/ && ln -s /opt/tomcat/apache-tomcat-${TOMCAT_VERSION}/ ${CATALINA_HOME}
RUN rm -f /tmp/tomcat.*


EXPOSE 8080 8443


CMD ["catalina.sh", "run"]