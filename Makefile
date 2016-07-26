all:
	@echo "yay!"

configure:
	mkdir -p /etc/telegraf
	cp -i ./bin/telegraf /usr/bin
	cp -i  ./etc/telegraf.conf /etc/telegraf/telegraf.conf
	cp -i  ./etc/telegraf.env /etc/default/telegraf.env

install:
	cp -i  ./etc/telegraf.env /etc/default/telegraf.env

remove-telegraf:
	./scripts/remove_telegraf.sh

uninstall: remove-telegraf
	@echo "Uninstalled successful"
	
