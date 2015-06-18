FROM phusion/baseimage:0.9.16
MAINTAINER hernandito

# Set correct environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME            /root
ENV LC_ALL          C.UTF-8
ENV LANG            en_US.UTF-8
ENV LANGUAGE        en_US.UTF-8
ENV TERM xterm


# Use baseimage-docker's init system
CMD ["/sbin/my_init"]


# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /home nobody && \
 chown -R nobody:users /home


# FFMPEG Repository
RUN add-apt-repository ppa:mc3man/trusty-media
RUN apt-get update 
RUN apt-get install -qy ffmpeg 

RUN apt-get install -qy mc

# Install Java
RUN apt-get install -qy software-properties-common
RUN apt-get install -qy python-software-properties

RUN apt-get install python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install oracle-java7-installer

############# Dont forget to set the ENVIRONEMENT VARIABLE  
############  JAVA_HOME=/usr/lib/jvm/java-7-oracle

RUN apt-get install -qy libimage-exiftool-perl 
RUN apt-get install -qy dcraw ufraw 
RUN apt-get install -qy gpac
RUN apt-get install -qy imagemagick 


# Stuff needed for ResourceSpace - Not sure needed here.
#RUN apt-get install -qy poppler-utils 
#RUN apt-get install -qy libav-tools 
#RUN apt-get install -qy libavcodec-extra-54 
#RUN apt-get install -qy libavformat-extra-54 
#RUN apt-get install -qy libgs-dev 

RUN mkdir /root/razuna
ADD razuna_tomcat_1_7/ /root/razuna/

#Install GhostScript
ADD gs /usr/bin/gs

# Expose Ports
EXPOSE 8080 443

# The www directory and proxy config location
VOLUME ["/opt"]

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh


