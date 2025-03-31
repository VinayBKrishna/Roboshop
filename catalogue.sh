source common.sh
component="catalogue"

nodejs_setup

print_head install mongodb-mongosh
dnf install mongodb-mongosh -y

print_head hosting mongosh
mongosh --host mongo-dev.mikeydevops1.online </app/db/master-data.js # this is an input redirector where input is given to host