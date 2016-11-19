include env_make

essentials:
	yi htop	

ssh:
	echo "PubkeyAcceptedKeyTypes +ssh-dss" >> /etc/ssh/sshd_config
	service ssh restart

swapfile:
	dd if=/dev/zero of=/swapfile bs=512 count=16384000
	mkswap /swapfile
	chmod 600 /swapfile
	echo "/swapfile                               swap    swap    defaults        0 0" >> /etc/fstab
	swapon
	
mycloud:
	yi cifs-utils
	mkdir /mnt/mycloud
	echo "//$(MY_IP)/Share                   /mnt/mycloud                    cifs    user=$(MY_USERNAME),passw=$(MY_PASSWORD),rw                     0 0
" >> /etc/fstab
	mount /mnt/mycloud

profile:
	cp profile-info.sh /etc/profile.d
	chmod +x /etc/profile.d/profile-info.sh
	cp info.sh /usr/local/bin
	chmod +x /usr/local/bin/info.sh

gui:
	apt-add-repository ppa:xorg-edgers/ppa
	apt-get install indicator-weather
	apt-get install indicator-multiload
	apt-get install indicator-cpufreq
	add-apt-repository ppa:alexmurray/indicator-sensors
	indicator-sensors
	indicator-cpufreq
	apt-get install python
	apt-get install google-chrome-stable
	apt-get install google-chrome
	sudo apt-add-repository ppa:diesch/testing
	sudo apt-get install classicmenu-indicator
	classicmenu-indicator

default: essentials ssh swapfile mycloud profile
