#Dockerfil for apache Marmotta

FROM centos/systemd

RUN yum -y install git && \
    yum -y install maven && \
    git clone https://git-wip-us.apache.org/repos/asf/marmotta.git marmotta && \
    cd marmotta/ && \
    mvn clean install && \
    cd launchers/marmotta-webapp/ &&\
    tomcat7:run