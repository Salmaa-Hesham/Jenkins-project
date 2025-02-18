## INSTALLING LEMP
#!/bin/bash
logfilen=/var/log/results_nginx.log
errorlogn=/var/log/error_nginx.log

logfilem=/var/log/results_mysql.log
errorlogm=/var/log/error_mysql.log

logfilep=/var/log/results_php.log
errorlogp=/var/log/error_php.log


check_error() {
    if [ $? -ne 0 ]
    then
        echo "An error occurred please check errorlog"
        exit 1
    fi
}
## Update the system
echo "Ubdating the apt packages...."
apt update
apt upgrade -y

## Install NGINX........
if nginx -v >/dev/null 2>&1
then
    echo "Nginx is already installed"
else
    echo "Installing Nginx..."
    apt install nginx -y  1>>$logfilen 2>>$errorlogn
    check_error
fi

## Install MySQL......................
if mysql --version >/dev/null 2>&1
then
    echo "Mysql service is already installed"
else
    echo "Installing Mysql..."
    apt install mysql-server -y 1>>$logfilem 2>>$errorlogm
    check_error
fi

## install php...........................
if php --version >/dev/null 2>&1
then
    echo "PHP service is already installed"
else
    echo "Installing PHP..."
    apt install php php-cli php-mbstring php-xml php-curl php-mysql -y 1>>$logfilep 2>>$errorlogp
    check_error
fi
