source common.sh
component="user"

cp user.service /etc/systemd/system/user.service

print_head node disable
dnf module disable nodejs -y

print_head node enable
dnf module enable nodejs:20 -y
echo $?

dnf install nodejs -y
echo $?

print_head user added
useradd roboshop

print_head /APP DIREC created
mkdir /app

print_head file modified
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip
cd /app
unzip /tmp/user.zip
echo $?

print_head npmm install
cd /app
npm install
echo $?

systemmd_setup
systemctl status user

