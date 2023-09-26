#!/bin/bash
        
	#Installing apache2"

        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
	sudo apt install mysql-server -y
	sudo systemctl start mysql.service
	sudo systemctl enable mysql.service
	sudo apt install php libapache2-mod-php php-mysql -y
        sudo apt install git -y

	sudo passwd root <<EOF
	dhanu
	dhanu
EOF
	su <<EOF
	dhanu
EOF
	mysql -u root -e "alter user 'root'@'localhost' identified with mysql_native_password by 'root';"
	mysql -u root -e "flush privileges;"
	mysql -u root -proot -e "create database users;"
	
	sudo chmod 777 -R /var/www/html/
        cd /var/www/html

	git clone https://github.com/dhanushkaEkanayake/demo_web.git

	mv demo_web/* .

	mysql -u root -proot users < user_details.sql

