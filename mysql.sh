source common.sh

print_head install mysql
dnf install mysql-server -y
echo $?

print_head system enable
systemctl enable mysqld
systemctl start mysqld

print_head setting password for the data base
mysql_secure_installation --set-root-pass RoboShop@1
echo $?