#!/bin/bash
set -xe
   
imageList=imageList.txt

echo -e "hello～～ \033[36m ( ´ ▽ ` )ﾉ` )  \033[0m"
# read -p "Please give me registry:" offline_registry
# offline_registry="$registry_ip:58001"

offline_registry="9.135.114.4:58001"

# read -p "Please give me docker-login command:" command
# $(command)
docker login $offline_registry -uadmin -padmin123

function getImageName() {
  string=$1
  if [ ! $string ]; then
      return
  fi
  array_a=(${string//// })
  image=${array_a[@]:(-1)}
  array_b=(${image//:/ })
  echo ${array_b[0]}
}

function getImageTag() {
  string=$1
  if [ ! $string ]; then
      return
  fi
  array_a=(${string//// })
  image=${array_a[@]:(-1)}
  array_b=(${image//:/ })
  echo ${array_b[1]}
}

while read line
do
  校验镜像是否存在，使用命令检索是否存在
  res=$(docker images | awk '{print $1":"$2}' | grep $line)
  if [ ! $res ]; then
    echo "镜像不存在 $line"
  else
    if [ $isUpload == "true" ]; then
      处理镜像提交到私有仓库中
      获取镜像名称和版本号
      image_name="$(getImageName $line)"
      image_tag="$(getImageTag $line)"
      offline_image=$offline_registry/$image_name:$image_tag
      echo "===== 变更新仓库名并推送 $offline_image ====="
      docker tag $line $offline_image
      docker push $offline_image
    fi
  fi
done < imageList.txt