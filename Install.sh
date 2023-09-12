#!/bin/bash

# Ask for the database password
read -p "Enter a password for the Moodle database: " db_password

# Ask for the Moodle data directory location
read -p "Enter the path for your Moodle data directory (e.g., /var/Moodle-Cloud): " moodle_data_dir

# Update and upgrade packages
apt update -y && apt upgrade -y

# Install required packages
apt install -y apache2
apt install -y php libapache2-mod-php php-pspell php-curl php-gd php-intl php-mysql php-xml php-xmlrpc php-ldap php-zip php-soap php-mbstring graphviz aspell php-json php-cgi php-mysql php-curl unzip

# Restart Apache
systemctl restart apache2

# Download and install Moodle
wget https://packaging.moodle.org/stable402/moodle-latest-402.zip
unzip moodle-latest-402.zip
rm -r moodle-latest-402.zip
mv moodle /var/www/Moodle
chmod -R 0777 /var/www/Moodle

# Create Moodle data directory with 777 permissions
mkdir -m 777 "$moodle_data_dir"

# Install MariaDB server
apt install -y mariadb-server

# Configure Apache virtual host
sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/Moodle/' /etc/apache2/sites-enabled/000-default.conf

# Adjust PHP settings
sed -i 's/;max_input_vars =.*/max_input_vars = 5000/' /etc/php/8.2/apache2/php.ini
sed -i 's/;memory_limit =.*/memory_limit = 1024M/' /etc/php/8.2/apache2/php.ini
sed -i 's/;upload_max_filesize =.*/upload_max_filesize = 2048M/' /etc/php/8.2/apache2/php.ini
sed -i 's/;post_max_size =.*/post_max_size = 2048M/' /etc/php/8.2/apache2/php.ini

# Restart Apache
service apache2 restart

# Set up MySQL server with the provided password
mysql -e "CREATE DATABASE Moodle;"
mysql -e "CREATE USER 'Moodle'@'localhost' IDENTIFIED BY '$db_password';"
mysql -e "GRANT ALL ON Moodle.* TO 'Moodle'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

clear
# Display instructions to access Moodle
echo "Moodle has been installed successfully."
echo "You can access Moodle by visiting your server's IP address in your web browser."
