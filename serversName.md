frontend-dev.mikeydevops1.online:8080
mongo-dev.mikeydevops1.online
redis-dev.mikeydevops1.online
catalogue-dev.mikeydevops1.online:8080
user-dev.mikeydevops1.online:8080
cart-dev.mikeydevops1.online:8080
shipping-dev.mikeydevops1.online:8080
payment-dev.mikeydevops1.online:8080
mysql-dev.mikeydevops1.online
rabbitmq-dev.mikeydevops1.online:8080

distapch-dev.mikeydevops1.online




docker run -d -p 80:80 
 CATALOGUE_HOST=catalogue-dev.mikeydevops1.online 
 CATALOGUE_PORT=8080 
 USER_HOST=user-dev.mikeydevops1.online 
 USER_PORT=8080 
CART_HOST=cart-dev.mikeydevops1.online 
 CART_PORT=8080 
SHIPPING_HOST=shipping-dev.mikeydevops1.online 
 SHIPPING_PORT=8080 
 PAYMENT_HOST=payment-dev.mikeydevops1.online 
 PAYMENT_PORT=8080 
public.ecr.aws/w8x4g9h7/roboshop-v3/frontend






dnf install docker -y
docker run -d 
-p 8080:8080 
-e MONGO=true 
-e MONGO_URL="mongodb://mongo-ip:27017/catalogue" 
public.ecr.aws/w8x4g9h7/roboshop-v3/catalogue

docker run 
-e DB_TYPE=mongo 
-e APP_GIT_URL=https://github.com/roboshop-devops-project-v3/catalogue 
-e DB_HOST=mongo-ip 
-e SCHEMA_FILE=db/master-data.js 
public.ecr.aws/w8x4g9h7/roboshop-v3/schema-load





dnf install docker -y
docker run -d -p 8080:8080 
-e MONGO=true 
-e MONGO_URL="mongodb://mongo-ip:27017/users" 
-e REDIS_URL="redis://redis-ip:6379" 
public.ecr.aws/w8x4g9h7/roboshop-v3/user





dnf install docker -y
docker run -d -p 8080:8080 
-e CATALOGUE_HOST=catalogue-ip 
-e CATALOGUE_PORT=8080 
-e REDIS_HOST=redis-ip 
public.ecr.aws/w8x4g9h7/roboshop-v3/cart






dnf install docker -y
docker run -d -p 8080:8080 
-e CART_ENDPOINT=cart-ip:cart-port 
-e DB_HOST=mysql-ip 
public.ecr.aws/w8x4g9h7/roboshop-v3/shipping

docker run 
-e DB_TYPE=mysql 
-e APP_GIT_URL=https://github.com/roboshop-devops-project-v3/shipping 
-e DB_HOST=mysql-ip 
-e DB_USER=root 
-e DB_PASS=RoboShop@1 
-e SCHEMA_FILE=db/app-user.sql 
public.ecr.aws/w8x4g9h7/roboshop-v3/schema-load

docker run 
-e DB_TYPE=mysql 
-e APP_GIT_URL=https://github.com/roboshop-devops-project-v3/shipping 
-e DB_HOST=mysql-ip 
-e DB_USER=root 
-e DB_PASS=RoboShop@1 
-e SCHEMA_FILE=db/schema.sql 
public.ecr.aws/w8x4g9h7/roboshop-v3/schema-load

docker run
-e DB_TYPE=mysql
-e APP_GIT_URL=https://github.com/roboshop-devops-project-v3/shipping
-e DB_HOST=mysql-ip
-e DB_USER=root
-e DB_PASS=RoboShop@1
-e SCHEMA_FILE=db/master-data.sql
public.ecr.aws/w8x4g9h7/roboshop-v3/schema-load





dnf install docker -y
docker run -d -p 8080:8080 
-e CART_HOST=cart-ip 
-e CART_PORT=8080 
-e USER_HOST=user-ip 
-e USER_PORT=8080 
-e AMQP_HOST=rabbitmq-ip 
-e AMQP_USER=roboshop 
-e AMQP_PASS=roboshop123 
public.ecr.aws/w8x4g9h7/roboshop-v3/payment






























