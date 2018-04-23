FROM openjdk:8
ENV VER=3.12.0

RUN wget https://product-downloads.atlassian.com/software/jira/downloads/atlassian-servicedesk-$VER.tar.gz; \
tar xvf atlassian-servicedesk-$VER.tar.gz; rm atlassian-servicedesk-$VER.tar.gz
