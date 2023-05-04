script_path=$(dirname$0)
source ${script_path}\common.sh
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd ${app_user}
mkdir /app
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
cd /app
npm install
cp /home/centos/roboshop1/user.service /etc/systemd/system/user.service
systemctl daemon-reload
systemctl enable user
systemctl start user
cp /home/centos/roboshop1/mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.devopsbeginner.online </app/schema/user.js
systemctl restart user