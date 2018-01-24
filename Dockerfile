FROM centos/systemd

RUN yum -y update
RUN yum clean all

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH CATALINA_HOME/bin:$PATH

# Install build dependencies.
RUN yum install -y curl wget java-1.8.0-openjdk maven

# Get tomcat.
RUN wget http://apache.mirrors.lucidnetworks.net/tomcat/tomcat-8/v8.5.24/bin/apache-tomcat-8.5.24.tar.gz
RUN tar xvzf apache-tomcat-8.5.24.tar.gz
RUN mv apache-tomcat-8.5.24 /usr/local/tomcat
RUN rm -rf apache-tomcat-8.5.24.tar.gz /usr/local/tomcat/webapps/*

# Get marmotta.
RUN wget http://apache.osuosl.org/marmotta/3.3.0/apache-marmotta-3.3.0-webapp.tar.gz
RUN tar xvzf apache-marmotta-3.3.0-webapp.tar.gz
RUN cp /apache-marmotta-3.3.0/marmotta.war /usr/local/tomcat/webapps
RUN rm -rf apache-marmotta-3.3.0-webapp.tar.gz /apache-marmotta-3.3.0


RUN cd /usr/local/tomcat/bin/
#EXPOSE 8080

RUN chmod +x /usr/local/tomcat/bin/*.sh
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
#RUN sh /usr/local/tomcat/bin/catalina.sh run
