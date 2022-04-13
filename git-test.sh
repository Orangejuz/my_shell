#!/bin/sh
set -e
echo "请选择你想要上传的代码仓库："
vcs=("maven" "junit-maven" "junit-maven-id" "python" "junit-gradle" "demo-tool" "java-android-example" "Springfox-ApiDoc" "apidocjs-demo" "phpL5Swagger" "phpSwagger")

select usr_opt in "${vcs[@]}"
do 
  case $usr_opt in 
    "maven")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    "junit-maven")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    "junit-maven-id")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    "python")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    "junit-gradle")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    "demo-tool")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    "java-android-example")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    "Springfox-ApiDoc")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    "apidocjs-demo")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    "phpL5Swagger")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
    
    "phpSwagger")
      selection=$usr_opt
      echo "你选择上传的代码仓库是 $usr_opt \n"
      break
      ;;
      
    *)
      echo "invail input，please select again "
    ;;
  esac
done

read -p "请输入需要提交的代码仓库地址：" url
#https://e.dev-008.devops-cloud.club/codingcorp/lj/n9jux.git

is_http=$(echo $url | awk -F':' '{print $1}')

read -p "请输入账户：" test_ac
test_ac=${test_ac:-coding@coding.com}

read -s -p "请输入密码：" test_pw
test_pw=${test_pw:-coding123}

echo "\n"

if [ "$is_http" = "http" ];then 
url_git="${url:0:7}${test_ac/@/%40}":"${test_pw/,/%2C}"@"${url#http://}"
else
url_git="${url:0:8}${test_ac/@/%40}":"${test_pw/,/%2C}"@"${url#https://}"
fi


#echo ${url:0:8}${test_ac/@/%40}":"$test_pw"@"${url#https://}
echo "上传代码仓库链接：$url_git"


test_git_clone(){
    git remote remove 10
    git remote add 10 $url_git
    git push 10 master:master --force
    echo "仓库上传 ok \n"
}


if [ $usr_opt = "maven" ]
then
    cd /Users/juuuz/Desktop/work/maven-test
    test_git_clone
elif [ $usr_opt = "junit-maven" ]
then
    cd /Users/juuuz/Desktop/work/AutomationUseCaseLibrary-code/junit-maven-test
    test_git_clone
elif [ $usr_opt = "junit-maven-id" ]
then
    cd /Users/juuuz/Desktop/work/AutomationUseCaseLibrary-code/junit-maven-id
    test_git_clone
elif [ $usr_opt = "python" ]
then
    cd /Users/juuuz/Desktop/work/AutomationUseCaseLibrary-code/pytest3-test
    test_git_clone
elif [ $usr_opt = "demo-tool" ]
then
    cd /Users/juuuz/Desktop/work/AutomationUseCaseLibrary-code/junit-maven-id
    test_git_clone
elif [ $usr_opt = "java-android-example" ]
then
    cd /Users/juuuz/Desktop/work/AndroidApk/java-android-example
    test_git_clone
elif [ $usr_opt = "Springfox-ApiDoc" ]
then                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    cd /Users/juuuz/Desktop/work/ci-templates/Springfox-ApiDoc
    test_git_clone
elif [ $usr_opt = "apidocjs-demo" ]
then
    cd /Users/juuuz/Desktop/work/ci-templates/apidocjs-demo
    test_git_clone
elif [ $usr_opt = "phpL5Swagger" ]
then
    cd /Users/juuuz/Desktop/work/ci-templates/phpL5Swagger
    test_git_clone
elif [ $usr_opt = "phpSwagger" ]
then
    cd /Users/juuuz/Desktop/work/ci-templates/phpL5Swagger
    test_git_clone
else [ $usr_opt = "junit-gradle" ]
    cd /Users/juuuz/Desktop/work/AutomationUseCaseLibrary-code/junit-gradle-test
    test_git_clone
fi

                                                                                                                                                                                                                                                                                                                                                                                                                                           