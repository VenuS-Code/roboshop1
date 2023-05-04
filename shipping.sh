source common.sh
yum install maven -y
useradd ${app_user}
mkdir /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar
cp /home/centos/roboshop1/shipping.service /etc/systemd/system/shipping.service
systemctl daemon-reload
systemctl enable shipping
systemctl start shipping
yum install mysql -y
mysql -h mysql.devopsbeginner.online -uroot -pRoboshop@1 < /app/schema/shipping.sql
systemctl restart shipping