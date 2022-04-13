#!/bin/bash
set -e

echo "欢迎用脚本执行开放生态测试！"

read -p  "请输入你想要设置开放生态的应用主页：" homepage

is_http=$(echo $homepage | awk -F':' '{print $1}')

echo "URL 的协议是：$is_http"

if [ "$is_http" = "https" ];then 
call_back="https://127.0.0.1/api/oauth/callback"
else
call_back="http://127.0.0.1/api/oauth/callback"
fi

echo "回调的地址是： \n $call_back"

read -p  "请输入你的 ID：" ID
read -p  "请输入你的 secret：" secret

# https://codingcorp.dev-006.devops-cloud.club/oauth_authorize.html?client_id=b39a96c6145519c3aef147e1f24ce6b1&redirect_uri=https://127.0.0.1/api/oauth/callback&response_type=code&scope=user


url1="$homepage/oauth_authorize.html?client_id=$ID&redirect_uri=$call_back&response_type=code&scope=user"
echo "第一个链接为： \n $url1"

echo "请复制该链接去网页进行授权操作"
#授权操作
read -p  "请输入你授权之后的 code ：" code

#https://codingcorp.dev-006.devops-cloud.club/api/oauth/access_token?code=aoftvbuOcMHwuNjTbYHT2Lcp&client_id=b39a96c6145519c3aef147e1f24ce6b1&client_secret=6bab33de62384bdc53ec7bae74214eccbe3376e6&grant_type=authorization_code

url2="$homepage/api/oauth/access_token?code=$code&client_id=$ID&client_secret=$secret&grant_type=authorization_code"
echo "第一个链接为： \n $url2"

echo "请复制该链接去网页进行第二次操作，获取 access_token ： \n $url2"
read -p  "请输入你授权之后的 access_token ：" access_token

#https://codingcorp.dev-006.devops-cloud.club/api/me?access_token=11e3a14e-65f7-4063-a9f3-5244a0c1bdce
url3="$homepage/api/me?access_token=$access_token"
echo "请复制该链接去网页进行第三次操作: \n $url3"

echo "测试完毕！！！"
