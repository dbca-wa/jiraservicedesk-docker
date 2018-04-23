FROM openjdk:8
ENV SERVICEDESK_VERSION=3.12.0
ENV JIRA_HOME=/data
ENV CATALINA_OPTS="-Dfqdn=servicedesk.mydomain.com" 

VOLUME /data
WORKDIR /srv

RUN wget -q https://product-downloads.atlassian.com/software/jira/downloads/atlassian-servicedesk-$SERVICEDESK_VERSION.tar.gz; \
tar xf atlassian-servicedesk-$SERVICEDESK_VERSION.tar.gz; rm atlassian-servicedesk-$SERVICEDESK_VERSION.tar.gz; \
mv atlassian-* servicedesk; sed -i "s/exit 1/exit 0/g" servicedesk/bin/check-java.sh;

COPY server.xml servicedesk/conf/server.xml
EXPOSE 8080/tcp

ENTRYPOINT ["servicedesk/bin/start-jira.sh", "-fg"]
