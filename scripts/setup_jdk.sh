#!/bin/bash
# Simple script
if [ $# -ne 1 ]; then
	echo "usage: $(basename $0) <path to jdk installation>"
	echo "       eg: setup.py /opt/java/oracle/jdk1.8.0_162"
	exit 1
fi
TARGET_PATH=$1
echo "Configuring JDK for $TARGET_PATH"
sudo update-alternatives --install "/usr/bin/java" "java" "$TARGET_PATH/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "$TARGET_PATH/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "$TARGET_PATH/bin/javaws" 1
sudo update-alternatives --install "/usr/bin/jar" "jar" "$TARGET_PATH/bin/jar" 1 

sudo update-alternatives --set "java" "$TARGET_PATH/bin/java"
sudo update-alternatives --set "javac" "$TARGET_PATH/bin/javac"
sudo update-alternatives --set "javaws" "$TARGET_PATH/bin/javaws"
sudo update-alternatives --set "jar" "$TARGET_PATH/bin/jar" 
