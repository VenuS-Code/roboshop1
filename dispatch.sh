script_path=$(dirname$0)
source ${script_path}\common.sh
yum install golang -y
useradd ${app_user}
mkdir /app
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip
cd /app
go mod init dispatch
go get
go build
cp /home/centos/roboshop1/dispatch.service /etc/systemd/system/dispatch.service
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch