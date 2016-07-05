function disable_systemd(){
  systemctl disable telegraf
  rm -f /lib/systemd/system/telegraf.service
}

if [[ -f /etc/os-release ]]; then
    which systemctl &>/dev/null
    if [[ $? -eq 0 ]]; then
      echo "Uninstalling telegraf"
      rm -r /etc/telegraf
      rm -f /usr/telegraf
      disable_systemd
    else
      echo "Need to install systemd"
    fi
fi
