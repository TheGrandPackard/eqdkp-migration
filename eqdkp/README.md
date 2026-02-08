# EQDKP

## SSH
Copy over `authorized_keys` to `/home/ubuntu/.ssh/authorized_keys` for SSH

## MariaDB

1. [Install and configure MariaDB](https://linuxsecurity.com/howtos/secure-my-webserver/installing-securing-mariadb)
```sh
sudo apt install mariadb-server 
sudo systemctl status mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
```

2. Export database
```sh
mariadb-dump -u root -p > kingdo16_eqdkp.sql
```

3. Import database
```sh
mysql -u root -p
mysql > CREATE DATABASE kingdo16_eqdkp;
mysql > exit;
mysql -u root -p < kingdo16_eqdkp.sql
```

4. Create `kingdo16_dbadmin` // `Meowmeowmeow1!` user with full privileges to `kingdo16_eqdkp` database

## Apache

1. [Install and configure Apache2](https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu)
```sh
sudo apt install apache2 
sudo systemctl enable apache2
```

Copy virtualhost files into `/etc/apache2/sites-available` and create symbolic links in `/etc/apache2/sites-enabled`
```sh
cd /etc/apache2/sites-enabled
ln -s ../sites-available/*.conf
```

```sh
sudo apt install certbot python3-certbot-apache
```

```sh
tar cvzf eqdkp.tar.gz /var/www/html/eqdkp
```

```sh
cd /var/www/html
scp ubuntu@52.203.107.149:/var/www/html/eqdkp.tar.gz .
tar xvzf eqdkp.tar.gz
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