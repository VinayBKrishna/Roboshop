source common.sh
component="nginx"

print_head Disable Default Nginx
dnf module disable nginx -y >> log_file
exit_status $?

print_head enable Nginx
dnf module enable nginx:1.24 -y >> log_file
exit_status $?


print_head install Nginx
dnf install nginx -y >> log_file
exit_status $?

print_head copy files
cp nginx.conf /etc/nginx/nginx.conf >> log_file
exit_status $?

print_head remove old file
rm -rf /usr/share/nginx/html/*
exit_status $?

print_head download main file
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip >> log_file
cd /usr/share/nginx/html
exit_status $?

print_head unzip to folder
unzip /tmp/frontend.zip >> log_file
exit_status $?

print_head restart nginx
systemctl restart nginx
exit_status $?


print_head status nginx
systemctl status nginx
exit_status $?
