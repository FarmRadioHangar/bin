#!/bin/bash

BIN_DIR=/usr/bin
LOG_DIR=/var/log/telegraf
SCRIPT_DIR=$PWD/scripts


function install_systemd {
    cp -f $SCRIPT_DIR/telegraf.service /lib/systemd/system/telegraf.service
    systemctl enable telegraf || true
    systemctl daemon-reload || true
}



id telegraf &>/dev/null
if [[ $? -ne 0 ]]; then
    useradd -r -K USERGROUPS_ENAB=yes -M telegraf -s /bin/false -d /etc/telegraf
fi

test -d $LOG_DIR || mkdir -p $LOG_DIR
chown -R -L telegraf:telegraf $LOG_DIR
chmod 755 $LOG_DIR



if [[ -f /etc/os-release ]]; then
    which systemctl &>/dev/null
    if [[ $? -eq 0 ]]; then
      echo "INSTALLING telegraf systemd service"
	    install_systemd
	    systemctl restart telegraf || echo "WARNING: systemd not running."
    else
      echo "Need to install systemd"
    fi
fi
