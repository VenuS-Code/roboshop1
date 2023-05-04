dnf module disable mysql -y
cp ${script_path}/mysql.repo /etc/yum.repos.d/mysql.repo
yum install mysql-community-server -y
mysql_secure_installation --set-root-pass Roboshop@1
mysql -uroot -pRoboshop@1
