source common.sh
component="cart"

cp cart.service /etc/systemd/system/cart.service

print_head node disabled
dnf module disable nodejs -y
dnf module enable nodejs:20 -y

print_head nodejs installed
dnf install nodejs -y



useradd roboshop

artificat_download

cd /app
npm install

systemmd_setup
systemctl status cart