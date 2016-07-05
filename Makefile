install-telegraf:prepare
	cp -i ./bin/telegraf /usr/bin
	cp -i  ./etc/telegraf.conf /etc/telegraf/telegraf.conf
	./scripts/install_telegraf.sh

prepare:
	mkdir -p /etc/telegraf
