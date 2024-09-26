FROM httpd:latest

RUN apt update && apt upgrade -y

COPY . . /var/www/html/

EXPOSE 80

#CMD ["apachectl -D", "FOREGROUD"]

CMD ["apache2ctl", "-D", "FOREGROUND"]
