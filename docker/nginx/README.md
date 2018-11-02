# janus-cluster
## Build

docker build -t nginx-lb:$(git describe --tags) .


## TLS Cert issusing

wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto

# How to get single cert for subdmain domain
# Non interactive
sudo ./certbot-auto certonly --standalone -d cloud1.kristianpaul.org -m paul@kristianpaul.org --agree-tos -n --cert-path .
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/cloud1.kristianpaul.org/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/cloud1.kristianpaul.org/privkey.pem

# How to get single wilcard cert for domain
# Requires TXT entry to be created
sudo ./certbot-auto certonly --manual -d *.kristianpaul.org -m paul@kristianpaul.org --agree-tos 
