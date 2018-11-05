# janus-cluster
## Build

docker build -t nginx-lb:v0.1 .


## TLS Cert issusing

wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto

# How to get single cert for subdmain domain
# Non interactive
sudo ./certbot-auto certonly --manual -d *.webcall.ninjapbx.com -m cristian.paul@prexenx.com --agree-tos 
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/webcall.ninjapbx.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/webcall.ninjapbx.com/privkey.pem


# Backup to S3
aws s3 cp fullchain.pem  s3://webcall-ninjapbx-certbot/
aws s3 cp  privkey.pem s3://webcall-ninjapbx-certbot/
