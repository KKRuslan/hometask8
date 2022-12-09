VAR_LOCALHOST="/var/www/localhost/"
INDEX_FILE=$VAR_LOCALHOST"index.html"

sudo mkdir -p $VAR_LOCALHOST && sudo touch $INDEX_FILE
sudo cat /home/vagrant/www-content/index.html > $INDEX_FILE

sudo mkdir -p "/etc/httpd/conf.d/"
sudo cat /home/vagrant/www-content/localhost.conf > /etc/httpd/conf.d/localhost.conf

chcon -Rt httpd_sys_content_t $VAR_LOCALHOST

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -subj "/C=UA/CN=localhost/L=Lviv/O=ITSU"
sudo yum install -y epel-release httpd mod_ssl
sudo httpd -t
sudo systemctl start httpd