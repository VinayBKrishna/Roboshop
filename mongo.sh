source common.sh
component="mongod"

print_head Copy
cp mongo.repo /etc/yum.repos.d/mongo.repo

print_head Install mongodb
dnf install mongodb-org -y

print_head ip address
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf

systemmd_setup