FROM pratikvanol/myapache

RUN apt-get install -y apache2-utils curl

RUN apt-get install php libapache2-mod-php php-mysql php-cli php-xml php-mbstring php-zip php-curl -y

RUN mkdir -p /var/run/apache2
RUN mkdir -p /etc/apache2/logs

ENV APACHE_LOG_DIR /etc/apache2/logs

COPY apache2.conf /etc/apache2

RUN a2enmod rewrite

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]