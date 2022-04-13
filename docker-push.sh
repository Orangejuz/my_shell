# !/bin/bash

echo "starting..."

echo "请先手动进行访问令牌生成！"

#docker tag <LOCAL_IMAGE_TAG> liju-docker.pkg.dev-001.devops-cloud.club/lj/docker/<PACKAGE>

read -p "请输入想要上传的制品 tag ：" image
read -p "请输入想要上传的制品远程 ：" image