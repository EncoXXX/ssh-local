all:
	@echo "\e[4;33mmake install\e[0m - will install ssh-local globally";
install:
	@sudo chmod 755 ./ssh-local.sh
	@echo " - Change file permissions to -rwxr-xr-x"
	@sudo cp ./ssh-local.sh /usr/bin/ssh-local
	@echo " - Move ./ssh-local.sh to /usr/bin/ssh-local"
	@echo "\nNow you can use \e[4;33mssh-local\e[0m globally"
