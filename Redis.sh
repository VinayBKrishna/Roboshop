source common.sh

print_head Disable redis
dnf module disable redis -y
dnf module enable redis:7 -y
echo $?

print_head install redis
dnf install redis -y
echo $?

print_head update redis config file
sed -i -e 's|127.0.0.1|0.0.0.0|' -e '/protected-mode/ c protected-mode no' /etc/redis/redis.conf
echo $?

systemctl enable redis
systemctl start redis
systemctl status redis
echo $?