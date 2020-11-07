FROM ubuntu
RUN echo 1.0 >> /etc/version && apt-get update \
		&& apt-get install -y python git iputils-ping
		
###WORKDIR #####
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt
RUN mkdir /datos1
WORKDIR /datos1
RUN touch f2.txt

### COPY ###
#COPY index.html .
#COPY app.log /datos

### ADD ###
#RUN mkdir /datos2
#ADD empaquetado.tar /datos2

### ENV ###
#ENV dir=/datos dir1=/datos1 dir2=/datos2
#RUN touch $dir/env.txt

### ARG ###
#ARG dir3
#RUN mkdir $dir3

### EXPOSE ####
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y apache2
EXPOSE 80
#apachectl start
#/bin/bash
ADD entrypoint.sh /datos

### VOLUME ###
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

### CMD ###
CMD ["sh","/datos/entrypoint.sh"]

### ENTRYPOINT ###
#ENTRYPOINT ["/bin/bash"]