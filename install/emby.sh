#!/usr/bin/env bash

## Emby模组 Emby moudle

set +e

#---Author Info---
ver="1.0.0"
Author="johnrosen1"
url="https://johnrosen1.com/"
github_url="https://github.com/johnrosen1/vpstoolbox"
#-----------------

install_emby(){
apt install -y apt-transport-https
curl -LO https://github.com/MediaBrowser/Emby.Releases/releases/download/4.6.7.0/emby-server-deb_4.6.7.0_amd64.deb
dpkg -i emby-server-deb_4.6.7.0_amd64.deb
}