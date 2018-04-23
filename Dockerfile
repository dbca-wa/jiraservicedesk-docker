FROM openjdk:8
ENV SERVICEDESK_VERSION=3.12.0

WORKDIR /srv

RUN wget -q https://product-downloads.atlassian.com/software/jira/downloads/atlassian-servicedesk-$SERVICEDESK_VERSION.tar.gz; \
tar xf atlassian-servicedesk-$SERVICEDESK_VERSION.tar.gz; rm atlassian-servicedesk-$SERVICEDESK_VERSION.tar.gz; \
mv atlassian-* servicedesk; sed -i "s/exit 1/exit 0/g" servicedesk/bin/check-java.sh;

ENTRYPOINT ["/srv/servicedesk/start-jira.sh", "-fg"]
