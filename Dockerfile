FROM centos
RUN yum update -y && yum install *openjdk*1.8* -y
ADD petclinic.ja tmp/petclinic.jar
WORKDIR /tmp
ENTRYPOINT ["java","-jar","petclinic.jar"]
EXPOSE 8080
