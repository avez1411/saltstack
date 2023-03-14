Asia/Kolkata:
  timezone.system:
    - utc: True

dependencies_install:
  pkg.installed:
    - pkgs:
      - apache2
      - apache2-utils
      - autoconf
      - gcc
      - libc6
      - libgd-dev
      - make
      - php
      - python
      - python3
      - tree
      - unzip
      - wget
      - automake
      - autotools-dev 
      - bc
      - build-essential
      - dc
      - gawk
      - gettext
      - libmcrypt-dev
      - libnet-snmp-perl
      - libssl-dev
      - snmp

nagios_zip_file:
  file.managed:
    - name: /home/shuhari/nagios-4.4.5.tar.gz
    - user: shuhari
    - group: shuhari
    - mode: 755
    - source: salt://nagios/templates/nagios-4.4.5.tar.gz

plugins_zip_file:
  file.managed:
    - name: /home/shuhari/nagios-plugins-release-2.2.1.tar.gz
    - user: shuhari
    - group: shuhari
    - mode: 755
    - source: salt://nagios/templates/nagios-plugins-release-2.2.1.tar.gz

/usr/local/nagios/etc/objects/servers:
  file.directory:
    - user: nagios
    - group: nagios
    - mode: 755
    - makedirs: True

IDS_cfg_file:
  file.managed:
    - name: /usr/local/nagios/etc/objects/servers/IDS.cfg
    - user: nagios
    - group: nagios
    - mode: 664
    - source: salt://nagios/templates/IDS.cfg

nginx_cfg_file:
  file.managed:
    - name: /usr/local/nagios/etc/objects/servers/nginx.cfg
    - user: nagios
    - group: nagios
    - mode: 664
    - source: salt://nagios/templates/nginx.cfg

SaltMaster_cfg_file:
  file.managed:
    - name: /usr/local/nagios/etc/objects/servers/SaltMaster.cfg
    - user: nagios
    - group: nagios
    - mode: 664
    - source: salt://nagios/templates/SaltMaster.cfg

Server_backup_cfg_file:
  file.managed:
    - name: /usr/local/nagios/etc/objects/servers/Server_backup.cfg
    - user: nagios
    - group: nagios
    - mode: 664
    - source: salt://nagios/templates/Server_backup.cfg

web1_cfg_file:
 file.managed:
    - name: /usr/local/nagios/etc/objects/servers/web1.cfg
    - user: nagios
    - group: nagios
    - mode: 664
    - source: salt://nagios/templates/web1.cfg

web2_cfg_file:
 file.managed:
    - name: /usr/local/nagios/etc/objects/servers/web2.cfg
    - user: nagios
    - group: nagios
    - mode: 664
    - source: salt://nagios/templates/web2.cfg

ncpa_py_file:
 file.managed:
    - name: /usr/local/nagios/libexec/check_ncpa.py
    - user: nagios
    - group: nagios
    - mode: 755
    - source: salt://nagios/templates/check_ncpa.py

delete_commands_cfg:
  file.absent:
    - name: /usr/local/nagios/etc/objects/commands.cfg

delete_templates_cfg:
  file.absent:
    - name: /usr/local/nagios/etc/objects/templates.cfg

commands_file:
 file.managed:
    - name: /usr/local/nagios/etc/objects/commands.cfg
    - user: nagios
    - group: nagios
    - mode: 664
    - source: salt://nagios/templates/commands.cfg

templates_file:
 file.managed:
    - name: /usr/local/nagios/etc/objects/templates.cfg
    - user: nagios
    - group: nagios
    - mode: 664
    - source: salt://nagios/templates/templates.cfg

addline_nagios_cfg:
  file.append:
    - name: /usr/local/nagios/etc/nagios.cfg
    - text:
      - "cfg_dir=/usr/local/nagios/etc/objects/servers"

nagios-script.sh:
  cmd.script:
   - name: nagios-script.sh
   - runas: root
    - cwd: /home/shuhari
    - source: salt://nagios/templates/nagios-script.sh 

plugins-script.sh:
  cmd.script:
    - name: plugins-script.sh
    - runas: root
    - cwd: /home/shuhari
    - source: salt://nagios/templates/plugins-script.sh

nagiosadmin:
  webutil.user_exists:
    - password: admin@123
    - htpasswd_file: /usr/local/nagios/etc/htpasswd.users
    - options: d
    - runas: root

nagios_service:
  service.running:
    - name: nagios
    - enable: True

apache2_service:
  service.running:
    - name: apache2
    - enable: True

/home/shuhari/nagios-4.4.5:
  cmd.run:
    - name: sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled  

/home/shuhari/nagios-4.4.5:
  cmd.run:
    - name: sudo make all


