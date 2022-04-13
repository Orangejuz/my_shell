# !/bin/bash
mkdir /usr/gradle
cd /usr/gradle
wget https://downloads.gradle.org/distributions/gradle-4.6-bin.zip
unzip -d /opt/gradle gradle-4.6-bin.zip

# bash 使用 /etc/profile
sed -i '$a\PATH=$PATH:/opt/gradle/gradle-4.6/bin' /etc/profile
sed -i '$a\export PATH' /etc/profile

source /etc/profile

# zsh 使用 ~/.zshrc
sed -i '$a\PATH=$PATH:/opt/gradle/gradle-4.6/bin' ~/.zshrc
sed -i '$a\export PATH' ~/.zshrc

source ~/.zshrc

gradle --version