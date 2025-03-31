source common.sh
component="cart"

dnf module disable nodejs -y
dnf module enable nodejs:20 -y

dnf install nodejs -y

cp cart.service /etc/systemd/system/cart.service

useradd roboshop

artificat_download

cd /app
npm install

systemmd_setup