source common.sh
component="catalogue"

cp catalogue.service /etc/systemd/system/catalogue.service

print_head node disable
dnf module disable nodejs -y
echo $?

print_head node enable
dnf module enable nodejs:20 -y
echo $?

print_head install nodejs
dnf install nodejs -y
echo $?

print_head user added
useradd roboshop

print_head /APP DIREC created
mkdir /app

print_head file modified
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip

cd /app
npm install

systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue



print_head install mongodb-mongosh
dnf install mongodb-mongosh -y

print_head hosting mongosh
# this is an input redirector where input is given to host
mongosh --host mongo-dev.mikeydevops1.online </app/db/master-data.js