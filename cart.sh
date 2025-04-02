source common.sh
component="cart"

cp cart.service /etc/systemd/system/cart.service
  echo $?

print_head node disabled
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
  echo $?

print_head nodejs installed
dnf install nodejs -y
  echo $?

print_head user added
useradd roboshop
echo $?

mkdir /app

print_head files extration
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip
cd /app
unzip /tmp/cart.zip
  echo $?

print_head npm install
cd /app
npm install
  echo $?


systemctl daemon-reload
systemctl enable cart
systemctl start cart
echo $?


print_head nodejs installed
systemctl status cart
echo $?

print_head log messages
tail -f /var/log/messages
echo $?

