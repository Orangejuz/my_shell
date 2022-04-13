# !/bin/bash
mkdir /usr/java && cd /usr/java
curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz -O
tar xzf jdk-8u271-linux-x64.tar.gz 

javaVersion=`ls |grep jdk1.8.0` 
sed -i '$a\export javaVersion='$javaVersion'' /etc/profile
sed -i '$a\export JAVA_HOME=/usr/java/$javaVersion' /etc/profile
sed -i '$a\export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib' /etc/profile
sed -i '$a\export PATH=$JAVA_HOME/bin:$PATH' /etc/profile

source /etc/profile

# zsh 使用 ~/.zshrc
sed -i '$a\export javaVersion='$javaVersion'' ~/.zshrc
sed -i '$a\export JAVA_HOME=/usr/java/$javaVersion' ~/.zshrc
sed -i '$a\export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib' ~/.zshrc
sed -i '$a\export PATH=$JAVA_HOME/bin:$PATH' ~/.zshrc

source ~/.zshrc

java -version