###########################################################################NAGIOS######################################################################################
#sudo dpkg-reconfigure tzdata

#sudo apt-get install \
#apache2 \
#apache2-utils \
#autoconf \
#gcc \
#libc6 \
#libgd-dev \
#make \
#php \
#python \
#python3 \
#tree \
#unzip \
#wget -y

#cd /tmp

#sudo wget http://192.168.1.251/sw/nagios/nagios-4.4.5.tar.gz
tar -zxf nagios-4.4.5.tar.gz
cd nagios-4.4.5

sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all
sudo make install-groups-users

#sudo passwd nagios
sudo usermod -a -G nagios www-data

sudo make install
sudo make install-daemoninit
sudo make install-commandmode
sudo make install-config
sudo make install-webconf


sudo a2enmod rewrite
sudo a2enmod cgi

#sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
sudo systemctl restart apache2
sudo systemctl restart nagios

#sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
########################################################################NAGIOS-PLUGINS################################################################################

#sudo apt-get install \
#automake \
#autotools-dev \
#bc \
#build-essential \
#dc \
#gawk \
#gettext \
#libmcrypt-dev \
#libnet-snmp-perl \
#libssl-dev \
#snmp -y

#cd /tmp
#sudo wget http://192.168.1.251/sw/nagios/nagios-plugins-release-2.2.1.tar.gz
#tar -zxf nagios-plugins-release-2.2.1.tar.gz
#cd  nagios-plugins-release-2.2.1
#sudo ./tools/setup
#sudo ./configure
#sudo make
#sudo make install


#sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin


