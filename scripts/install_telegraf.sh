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




# Distribution-specific logic
if [[ -f /etc/redhat-release ]]; then
    # RHEL-variant logic
    which systemctl &>/dev/null
    if [[ $? -eq 0 ]]; then
	    install_systemd
    else
	    # Assuming sysv
	    install_init
	    install_chkconfig
    fi
elif [[ -f /etc/debian_version ]]; then
    # Debian/Ubuntu logic
    which systemctl &>/dev/null
    if [[ $? -eq 0 ]]; then
	    install_systemd
	    systemctl restart telegraf || echo "WARNING: systemd not running."
    #else
			## Assuming sysv
			#install_init
			#install_update_rcd
			#invoke-rc.d telegraf restart
    fi
#elif [[ -f /etc/os-release ]]; then
    #source /etc/os-release
    #if [[ $ID = "amzn" ]]; then
			## Amazon Linux logic
			#install_init
			#install_chkconfig
    #fi
fi
