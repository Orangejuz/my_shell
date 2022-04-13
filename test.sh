#!/bin/sh
url="https://git.dev-006.devops-cloud.club/codingcorp/lj/maven.git"
test_ac="coding@coding.com"
test_pw="coding123"
url_git="${url:0:8}${test_ac/@/%40}":"${test_pw/,/%2C}"@"${url#https://}"
#echo ${url:0:8}${test_ac/@/%40}":"$test_pw"@"${url#https://}
echo "上传代码仓库链接：$url_git"