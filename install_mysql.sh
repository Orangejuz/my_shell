# 安装 mysql 库
echo "开始安装ing。。。。"
yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
# 安装 mysql 服务
yum install -y mysql-server --allowerasing
# 启动 mysql
service mysqld start
# 初始化 mysql 配置
 /usr/bin/mysql_secure_installation
# 查看 mysql 版本
mysql -V
# 登录
 mysql -u root -p 
# 添加新用户
CREATE USER 'coding'@'localhost' IDENTIFIED BY ' coding123';

GRANT ALL PRIVILEGES ON *.* TO 'coding'@'localhost' WITH GRANT OPTION;

CREATE USER 'coding'@'%' IDENTIFIED BY ' coding123';

GRANT ALL PRIVILEGES ON *.* TO 'coding'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

echo "安装结束。。。。"