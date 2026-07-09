FROM amazonlinux
RUN yum upgrade && yum install git -y && yum install maven java-17 -y wget tar zip
ENV JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto
ENV PATH=$JAVA_HOME/bin:$PATH
WORKDIR /opt
RUN git clone https://github.com/durgaprasaduniq/pet_shop-2.git
RUN cd pet_shop-2 && mvn clean package
WORKDIR /opt
RUN wget https://archive.apache.org/dist/tomcat/tomcat-11/v11.0.0/bin/apache-tomcat-11.0.0.tar.gz && \
    tar -xzf apache-tomcat-11.0.0.tar.gz && \
    mv apache-tomcat-11.0.0 tomcat
RUN cp pet_shop-2/target/*.war /opt/tomcat/webapps
CMD ["/opt/tomcat/bin/catalina.sh","run"]
EXPOSE 8080
