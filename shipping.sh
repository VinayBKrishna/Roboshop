source common.sh
component="shipping"

print_head maven setup
maven_setup

mysql -h mysql-dev.mikeydevops1.online -uroot -pRoboShop@1 < /app/db/schema.sql

mysql -h mysql-dev.mikeydevops1.online -uroot -pRoboShop@1 < /app/db/app-user.sql

mysql -h mysql-dev.mikeydevops1.online -uroot -pRoboShop@1 < /app/db/master-data.sql




