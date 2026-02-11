# EQDKP

## MariaDB

1. [Install and configure MariaDB](https://linuxsecurity.com/howtos/secure-my-webserver/installing-securing-mariadb)

```sh
sudo apt update
sudo apt install mariadb-server
sudo systemctl enable mariadb
sudo mysql_secure_installation
```

Use root password: `KingdomFTW!` and disable all test/etc access

2. Export database on old server

```sh
mkdir migration && cd migration
mariadb-dump -u kingdo16_dbadmin -p kingdo16_eqdkp > kingdo16_eqdkp.sql
tar cvzf kingdo16_eqdkp.sql.tar.gz kingdo16_eqdkp.sql
```

3. Import database on new server

```sh
mkdir migration && cd migration
scp ubuntu@172.26.6.228:/home/ubuntu/migration/kingdo16_eqdkp_2026_02_10.sql.tar.gz .
tar xvzf kingdo16_eqdkp.sql.tar.gz
mysql -u root -p
CREATE DATABASE kingdo16_eqdkp;
CREATE USER 'kingdo16_dbadmin'@'localhost' IDENTIFIED BY 'Meowmeowmeow1!';
GRANT ALL PRIVILEGES ON kingdo16_eqdkp.* TO 'kingdo16_dbadmin'@'localhost';
FLUSH PRIVILEGES;
exit;
mysql -u root -p kingdo16_eqdkp < kingdo16_eqdkp.sql
```

## Apache

1. [Install and configure Apache2](https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu)
   Install php 7.3 https://askubuntu.com/questions/1518232/ubuntu-24-04-and-php-7-4

```sh
sudo apt install apache2
sudo systemctl enable apache2
sudo apt install php7.3 php7.3-mysql php7.3-curl php7.3-gd php7.3-xml php7.3-mbstring php7.3-zip
sudo a2enmod rewrite
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo systemctl restart apache2
```

Copy virtualhost files into `/etc/apache2/sites-available` and create symbolic links in `/etc/apache2/sites-enabled`

```sh
cd /etc/apache2/sites-enabled
ln -s ../sites-available/*.conf
```

```sh
sudo apt install certbot python3-certbot-apache
sudo certbot --apache
```

```sh
tar cvzf eqdkp_2026_02_08.tar.gz /var/www/html/eqdkp
```

```sh
scp ubuntu@172.26.6.228:/var/www/html/eqdkp_2026_02_10.tar.gz .
tar xvzf eqdkp_2026_02_10.tar.gz
sudo chown -R www-data:www-data eqdkp
```

## Crontab

Mariadb and Apache crontab to start services if they stop

```sh
sudo crontab -e
```

```
*/5 * * * * /usr/bin/systemctl start mariadb
*/5 * * * * /usr/bin/systemctl start apache2
```
