FROM centos:7

# Fix yum repo (CentOS 7 vault)
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
     sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
     yum clean all && \
     yum install -y httpd wget unzip zip && \
     yum clean all

# Download template
WORKDIR /var/www/html
RUN wget -O healet.zip https://www.free-css.com/assets/files/free-css-templates/downloads/page296/healet.zip && \
    unzip healet.zip && \
    cp -rf healet-html/* . && \
    rm -rf healet-html healet.zip

# Expose port
EXPOSE 80

# Start Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
