source common.sh
component="catalogue"

nodejs_setup

dnf install mongodb-mongosh -y

mongosh --host mongo-dev.mikeydevops1.online </app/db/master-data.js # this is an input redirector where input is given to host