#!/bin/bash

# Check if ResourceSpace exists. If not, copy from /home
if [ -f /opt/razuna/tomcat/bin/startup.sh ]; then
  echo "Using existing Razuna install."
else
  echo "Copying Razuna into /opt folder."
  cp -R /root/razuna/ /opt/
  chmod -R 777 /opt/razuna/tomcat/bin/
 fi
 
 
 # Check if ffmpeg is installed
 if [ -f /usr/bin/ffmpeg ]; then
		echo "FFMpeg is already installed... doing nothing."
 else		
		add-apt-repository ppa:mc3man/trusty-media -y
		apt-get update
		apt-get update
		apt-get install -y ffmpeg
  fi
 
# Starting Razuna
	chmod -R 777 /opt/razuna/tomcat/bin/
	cd /opt/razuna/tomcat/bin/
	./startup.sh
