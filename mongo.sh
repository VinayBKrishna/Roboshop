source common.sh
component="mongod"

print_head Copy
cp mongod.repo /etc/yum.repos.d/mongo.repo
exit_status $?

print_head Install mongodb
dnf install mongodb-org -y
exit_status $?

systemctl enable mongod
systemctl start mongod
exit_status $?

print_head ip address
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf
exit_status $?

systemctl enable mongod
systemctl start mongod
systemctl restart mongod
exit_status $?
