#!/bin/bash

# Check if ResourceSpace exists. If not, copy from /home
if [ -f /opt/razuna/tomcat/startup.sh ]; then
  echo "Using existing Razuna install."
else
  echo "Moving Razuna into /opt folder."
  mv /root/razuna/ /opt/
  chmod -R 777 /opt/razuna/tomcat/bin/
 fi
 
 
chmod -R 777 /opt/razuna/tomcat/bin/
cd /opt/razuna/tomcat/bin/
./startup.sh
