read -p "Enter your host : " host
read -p "Enter your user : " user
read -p "Enter your password : " password

mysql -h $host -u $user -p$password -e "CREATE DATABASE IF NOT EXISTS factory;"
mysql -h $host -u $user -p$password factory < factory.sql