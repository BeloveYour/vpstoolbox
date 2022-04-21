#!/usr/bin/env bash

## 卸载模组 Uninstall moudle

## 仅用于卸载基础安装

set +e

uninstall(){
  set +e
  cd
  if [[ -f /usr/local/bin/trojan ]]; then
    if (whiptail --title "api" --yesno "卸载 (uninstall) trojan?" 8 68); then
    systemctl disable trojan --now
    rm -rf /etc/systemd/system/trojan*
    rm -rf /usr/local/etc/trojan/*
    rm -rf /root/.trojan/autoupdate.sh
    fi
  fi
  if [[ -f /usr/sbin/nginx ]]; then
    if (whiptail --title "api" --yesno "卸载 (uninstall) nginx?" 8 68); then
    systemctl disable nginx --now
    apt-get -y remove nginx*
    rm -rf /etc/apt/sources.list.d/nginx.list
    rm -rf /usr/share/nginx/html/
    fi
  fi
  if [[ -f /usr/bin/qbittorrent-nox ]]; then
    if (whiptail --title "api" --yesno "卸载 (uninstall) qbittorrent?" 8 68); then
    systemctl disable qbittorrent --now
    apt-get -y remove qbittorrent-nox
    rm /etc/systemd/system/qbittorrent.service
    fi
  fi
  if [[ -f /usr/bin/bittorrent-tracker ]]; then
    if (whiptail --title "api" --yesno "卸载 (uninstall) bittorrent-tracker?" 8 68); then
    systemctl disable tracker --now
    rm -rf /usr/bin/bittorrent-tracker
    rm /etc/systemd/system/tracker.service
    fi
  fi
  if [[ -f /usr/local/bin/aria2c ]]; then
    if (whiptail --title "api" --yesno "卸载 (uninstall) aria2?" 8 68); then
    systemctl disable aria --now
    rm -rf /etc/aria.conf
    rm -rf /usr/local/bin/aria2c
    rm /etc/systemd/system/aria2.service
    fi
  fi
  if [[ -f /usr/local/bin/filebrowser ]]; then
    if (whiptail --title "api" --yesno "卸载 (uninstall) filebrowser?" 8 68); then
    systemctl disable filebrowser --now
    rm /usr/local/bin/filebrowser
    rm /etc/systemd/system/filebrowser.service
    fi
  fi
  if [[ -f /usr/bin/tor ]]; then
    if (whiptail --title "api" --yesno "卸载 (uninstall) tor?" 8 68); then
    systemctl disable tor --now
    systemctl stop tor@default
    apt-get -y remove tor
    rm -rf /etc/apt/sources.list.d/tor.list
    fi
  fi
  if [[ -f /opt/netdata/usr/sbin/netdata ]]; then
    if (whiptail --title "api" --yesno "卸载 (uninstall) Netdata?" 8 68); then
    systemctl disable netdata --now
    fi
  fi
  if (whiptail --title "api" --yesno "卸载 (uninstall) acme.sh?" 8 68); then
    ~/.acme.sh/acme.sh --uninstall
  fi
  rm -rf /root/.trojan/
  apt-get update
  systemctl daemon-reload
  colorEcho ${INFO} "卸载完成"
}