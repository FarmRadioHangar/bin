all:
	@echo "yay!"

configure:
	chmod 755  ./scripts/voxbox-calls 
	chmod 755  ./scripts/voxbox-sms 
	chmod 755  ./scripts/metrics
	mkdir -p /etc/telegraf
	cp -i ./bin/telegraf /usr/bin
	cp -i ./bin/haika /usr/bin
	cp -i  ./etc/telegraf.conf /etc/telegraf/telegraf.conf
	cp -i ./scripts/voxbox-calls /usr/bin
	cp -i ./scripts/voxbox-sms /usr/bin
	cp -i ./scripts//metrics /usr/bin

install:
	./scripts/install_telegraf.sh

remove-telegraf:
	./scripts/remove_telegraf.sh

uninstall: remove-telegraf
	@echo "Uninstalled successful"
	
