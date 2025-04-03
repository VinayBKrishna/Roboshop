source common.sh
component="catalogue"

print_head copy file
cp catalogue.service /etc/systemd/system/catalogue.service
cp mongod.repo /etc/yum.repos.d/mongo.repo
exit_status $?

print_head node disable
dnf module disable nodejs -y
exit_status $?


print_head node enable
dnf module enable nodejs:20 -y
exit_status $?


print_head install nodejs
dnf install nodejs -y
exit_status $?


print_head user added
check_useradded

print_head /APP DIREC created
mkdir /app
exit_status $?


print_head file modified
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip
exit_status $?


cd /app
npm install
exit_status $?


systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
exit_status $?




print_head install mongodb-mongosh
dnf install mongodb-mongosh -y
exit_status $?


print_head hosting mongosh
# this is an input redirector where input is given to host
mongosh --host mongo-dev.mikeydevops1.online </app/db/master-data.js
exit_status $?
