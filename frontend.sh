source common.sh
component="nginx"

print_head Disable Default Nginx
dnf module disable nginx -y >> log_file


dnf module enable nginx:1.24 -y >> log_file


dnf install nginx -y >> log_file

cp nginx.conf /etc/nginx/nginx.conf >> log_file

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip >> log_file
cd /usr/share/nginx/html
unzip /tmp/frontend.zip >> log_file


systemmd_setup