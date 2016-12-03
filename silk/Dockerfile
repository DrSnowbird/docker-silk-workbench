FROM openkbs/jre-mvn-py3

MAINTAINER DrSnowbird 

ENV SILK_VERSION 2.7.1

WORKDIR /

RUN wget https://github.com/silk-framework/silk/releases/download/release-${SILK_VERSION}/silk-workbench-${SILK_VERSION}.tgz && \
    tar zxvf silk-workbench-${SILK_VERSION}.tgz && \
    rm -Rf /silk-workbench-${SILK_VERSION}.tgz

CMD ["/bin/bash", "/silk-workbench-2.7.1/bin/silk-workbench"]
