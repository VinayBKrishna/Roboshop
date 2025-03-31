dnf module disable redis -y
dnf module enable redis:7 -y

print_head install redis
dnf install redis -y

print_head update redis config file
sed -i -e 's|127.0.0.1|0.0.0.0|' -e '/protected-mode/ c protected-mode no' /etc/redis.conf

systemctl enable redis
systemctl start redis