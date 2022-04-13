# !/bin/bash

yum install android-sdk

# bash 使用 /etc/profile
sed -i '$a\export ANDROID_HOME=/usr/lib/android-sdk' /etc/profile
sed -i '$a\export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH' /etc/profile

source /etc/profile

# zsh 使用 ~/.zshrc
sed -i '$a\export ANDROID_HOME=/usr/lib/android-sdk' ~/.zshrc
sed -i '$a\export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH' ~/.zshrc

source ~/.zshrc


wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip
unzip commandlinetools-linux-6609375_latest.zip -d cmdline-tools
sudo mv cmdline-tools $ANDROID_HOME/

yes | sdkmanager --licenses