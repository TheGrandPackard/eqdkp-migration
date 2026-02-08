sudo supervisorctl stop eqdkp-api
chmod +x ./ro-eqdkp-api-new
mv ./ro/eqdkp-api-new ./ro/eqdkp-api
sudo supervisorctl start eqdkp-api
sleep 1
sudo supervisorctl tail -f eqdkp-api
