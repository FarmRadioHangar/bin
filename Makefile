install-telegraf:prepare
	cp -i ./bin/telegraf /usr/bin
	cp -i  ./etc/telegraf.conf /etc/telegraf/telegraf.conf
	cp -i  ./etc/telegraf.env /etc/default/telegraf.env
	./scripts/install_telegraf.sh

prepare:
	mkdir -p /etc/telegraf

remove-telegraf:
	./scripts/remove_telegraf.sh

uninstall: remove-telegraf
	@echo "Uninstalled successful"
	
