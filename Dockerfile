FROM centos
RUN yum install java-1.8.0-openjdk-devel
ADD petclinic.ja tmp/petclinic.jar
WORKDIR /tmp
ENTRYPOINT ["java","-jar","petclinic.jar"]
EXPOSE 8080
