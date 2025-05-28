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
-e CATALOGUE_HOST=catalogue-dev.mikeydevops1.online
-e CATALOGUE_PORT=8080
-e USER_HOST=user-dev.mikeydevops1.online
-e USER_PORT=8080
-e CART_HOST=cart-dev.mikeydevops1.online
-e CART_PORT=8080
-e SHIPPING_HOST=shipping-dev.mikeydevops1.online 
-e SHIPPING_PORT=8080
-e PAYMENT_HOST=payment-dev.mikeydevops1.online
-e PAYMENT_PORT=8080
public.ecr.aws/w8x4g9h7/roboshop-v3/frontend
