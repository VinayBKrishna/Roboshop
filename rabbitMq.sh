dnf install rabbitmq-server -y

print_head copiny files
cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
  echo $?

print_head enabeling
systemctl enable rabbitmq-server
systemctl start rabbitmq-server
  echo $?

print_head status
systemctl status rabbitmq-server
  echo $?

print_head adding and setting permissions
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
  echo $?
