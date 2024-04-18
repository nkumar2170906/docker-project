FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y debconf-utils dialog
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
RUN curl -o /var/www/html/the-new-audi.zip -L https://www.free-css.com/assets/files/free-css-templates/download/page79/the-new-audi.zip || (echo "Download failed" && exit 1)
WORKDIR /var/www/html
RUN unzip the-new-audi.zip
RUN cp -rvf the-new-audi/* .
RUN rm -rf the-new-audi the-new-audi.zip
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80
