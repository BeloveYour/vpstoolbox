#!/usr/bin/env bash

## Sonarr模组

set +e

#---Author Info---
ver="1.0.0"
Author="johnrosen1"
url="https://johnrosen1.com/"
github_url="https://github.com/johnrosen1/vpstoolbox"
#-----------------

install_sonarr(){
cd /usr/share/nginx/
mkdir sonarr
cd /usr/share/nginx/sonarr

    cat > "docker-compose.yml" << "EOF"
version: "3.8"
services:
  sonarr:
    network_mode: host
    image: lscr.io/linuxserver/sonarr
    container_name: sonarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Shanghai
    volumes:
      - /usr/share/nginx/sonarr/data:/config
      - /usr/share/nginx/sonarr/tvseries:/tv #optional
      - /usr/share/nginx/sonarr/downloads:/downloads #optional
    restart: unless-stopped
EOF

docker-compose up -d
sleep 10s;

cat /usr/share/nginx/sonarr/data/config.xml | grep AnalyticsEnabled &> /dev/null

if [[ $? != 0 ]]; then
docker-compose down
sed -i "s/<UrlBase><\/UrlBase>/<UrlBase>\/sonarr\/<\/UrlBase>/g" /usr/share/nginx/sonarr/data/config.xml
sed -i '$d' /usr/share/nginx/sonarr/data/config.xml
echo '  <AnalyticsEnabled>False</AnalyticsEnabled>' >> /usr/share/nginx/sonarr/data/config.xml
echo '  <UpdateAutomatically>True</UpdateAutomatically>' >> /usr/share/nginx/sonarr/data/config.xml
echo '</Config>' >> /usr/share/nginx/sonarr/data/config.xml
docker-compose up -d
fi
cd
}