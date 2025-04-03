print_head(){
  echo -e "\e[32m$*\e[0m"
  echo "**********************************" &>> $log_file
  echo -e "\e[32m$*\e[0m"
  echo "**********************************" &>> log_file
}

systemmd_setup(){
  echo  ${component}
  print_head systemmd_setup
  systemctl daemon-reload
  systemctl enable ${component}
  systemctl restart ${component}
  echo $?
}

shell_command_status(){
  if [ $1 -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILURE\e[0m"
  fi
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
  print_head file copy
  cp ${component}.service /etc/systemd/system/${component}.service
  echo $?

  print_head user added
  useradd roboshop
  echo $?

}

nodejs_setup(){
  print_head node disable
  dnf module disable nodejs -y

  print_head node enable
  dnf module enable nodejs:20 -y
  echo $?

  dnf install nodejs -y
  echo $?

  print_head user added
  useradd roboshop

  print_head /APP DIREC created
  mkdir /app

  print_head file modified
  curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
  cd /app
  unzip /tmp/catalogue.zip

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



log_file=/tmp/roboshop.log
rm -rf $log_file

