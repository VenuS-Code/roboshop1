dnf module disable mysql -y
cp /home/centos/roboshop1/mysql.repo /etc/yum.repos.d/mysql.repo
yum install mysql-community-server -y
mysql_secure_installation --set-root-pass RoboShop@1
mysql -uroot -pRoboShop@1