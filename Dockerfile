FROM centos:latest
RUN  sed -i 's/mirrorlist/#mirrorlist/g'  /etc/yum.repos.d/CentOS-*
RUN  sed -i 's/#baseurl=http://mirror.centOS.org/baseurl=http://vault.centos.org/g' /etc/yum.repos.d/CentOS-*
RUN  yum install httpd zip wget unzip -y
RUN  wget -O /var/www/html/healet.zip https://www.free-css.com/assets/files/free-css-templates/downloads/page296/healet.zip
WORKDIR /var/www/html
RUN  unzip healet.zip
RUN  cp -rf healet-html/* . &&\
     rm -rf healet-html
EXPOSE  80
CMD  ["/usir/sbin/httpd", "D", "FOREGROUND"]
