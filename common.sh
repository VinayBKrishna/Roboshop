systemmd_setup(){
  systemctl daemon-reload
  systemctl enable ${component}
  systemctl restart ${component}
  echo $?
}

artificat_download(){
  rm -rf /app ./path/file
  echo $?
  mkdir /app
  echo $?
  curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip
  echo $?
  cd /app
  unzip /tmp/${component}.zip
  echo $?

}

app_pre_req(){
  cp ${component}.service /etc/systemd/system/${component}.service
  echo $?
  useradd roboshop
  echo $?

}

nodejs_setup(){
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  echo $?

  app_pre_req
  dnf install nodejs -y
  echo $?
  artificat_download
  cd /app
  npm install
  echo $?
  systemmd_setup
  echo $?

}

maven_setup(){
  dnf install maven -y
  app_pre_req
  artificat_download
  cd /app
  mvn clean package
  mv target/${component}-1.0.jar ${component}.jar
  systemctl daemon-reload
  dnf install mysql -y
  systemmd_setup
}

python_setup(){
  dnf install python3 gcc python3-devel -y
  app_pre_req
  artificat_download
  cd /app
  pip3 install -r requirements.txt

  systemmd_setup

}

print_head(){
  echo -e "e\[36,$*\e[0m"
  echo "**********************************" &>> $log_file
  echo -e "e\[36,$*\e[0m"
  echo "**********************************" &>> log_file
}

log_file=/tmp/roboshop.log
rm -rf $log_file
