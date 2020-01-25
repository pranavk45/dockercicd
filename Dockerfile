FROM centos:centos7.6.1810
#RUN yum update -y
RUN yum install httpd -y
COPY ./index.html /usr/share/httpd/noindex/index.html
ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]
