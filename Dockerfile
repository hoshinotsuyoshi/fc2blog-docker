FROM centos
#mysql
RUN yum -y install mysql-server
#apache
RUN yum -y install httpd
#git
RUN yum -y install git

#supervisor
RUN wget http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh epel-release-6-8.noarch.rpm
RUN echo "enabled=1" >> /etc/yum.repos.d/epel.repo
RUN yum -y install supervisor

#php install
RUN yum -y install php php-mbstring php-mysql

#php setting
ADD php.ini /etc/php.ini

#mysql ready
RUN echo "NETWORKING=yes" >/etc/sysconfig/network
RUN /etc/init.d/mysqld start && mysqladmin -u root password 'your_password' && /etc/init.d/mysqld stop

#supervisor
RUN rm -f /etc/supervisord.conf
ADD supervisord.conf /etc/supervisord.conf

#app ready
RUN rm -rf /var/www/html && git clone https://github.com/fc2blog/blog /var/www/html && cd /var/www/html && mv public/config.php.sample public/config.php

#httpd ready
ADD httpd/httpd.conf  /etc/httpd/conf/httpd.conf
RUN chmod 777 /var/www/html/public/uploads/
RUN chmod 777 /var/www/html/app/temp/
RUN chmod 777 /var/www/html/app
ADD config.php /var/www/html/public/config.php

EXPOSE 80
CMD ["/usr/bin/supervisord"]
