source common.sh
component="dispatch"

dnf install golang -y

useradd roboshop

artificat_download

cd /app
go mod init dispatch
go get
go build

systemmd_setup

