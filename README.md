# EQDKP Migration

/var/www/html/eqdkp - 13G (uncompressed)
kingdo16_eqdkp - 100MB (uncompressed)

## Lightsail Networking
Open ports:
- SSH restricted to 76.174.174.227
- HTTP
- HTTPS

Move over static IP address to new instance

## Configure swap memory
[Configure 4GB of swap memory](https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-20-04)

## SSH
Copy over `authorized_keys` to `/home/ubuntu/.ssh/authorized_keys` for SSH

## [EQDKP](./eqdkp/README.md)

## [EQDKP-API](./eqdkp-api/README.md)
