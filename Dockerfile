FROM openjdk:23-oraclelinux9
RUN cd /etc/yum.repos.d/
RUN mkdir /opt/tomcat
RUN chmod 755 /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.88/bin/apache-tomcat-9.0.88.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.88.tar.gz
RUN mv apache-tomcat-9.0.88/* /opt/tomcat
RUN chmod 755 /opt/tomcat/webapps/
RUN mkdir /opt/tomcat/webapps/mySite && chmod 755 /opt/tomcat/webapps/mySite
COPY index.html /opt/tomcat/webapps/mySite
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh","run"]