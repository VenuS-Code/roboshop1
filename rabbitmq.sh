echo -i -e "\e[36m >>>>setup erlang repos <<<<\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
yum install erlang -y
yum install rabbitmq-server -y
systemctl start rabbitmq-server
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
systemctl enable rabbitmq-server
systemctl restart rabbitmq-server

