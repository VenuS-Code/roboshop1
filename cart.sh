
source ${script_path}/common.sh

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd ${app_user}
mkdir /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
cd /app
npm install
cp ${script_path}/cart.service /etc/systemd/system/cart.service
systemctl daemon-reload
systemctl enable cart
systemctl start cart
