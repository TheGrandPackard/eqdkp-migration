# EQDKP API

1. Make directory for EQDKP api

```sh
mkdir eqdkp-api
```

2. Upload `eqdkp-api` and `.env` file to `/home/ubuntu/eqdkp-api`

3. Install supervisor and create config file

```sh
sudo apt install supervisor
sudo systemctl enable supervisor
sudo vi /etc/supervisor/conf.d/eqdkp-api.conf
```

4. Reload config and verify API is running

```sh
sudo supervisorctl reload
sudo supervisorctl status
```
