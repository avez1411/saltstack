install_pakage:
  pkg.installed:
    - pkgs:
      - nginx

nginx_conf:
  file.managed:
    - name: /etc/nginx/sites-available/rp.conf
    - user: root
    - group: root
    - mode: 640
    - source: salt://nginx/templates/rp.conf

remove_default:
  file.directory:
    - name: /etc/nginx/sites-enabled
    - clean: True

/etc/nginx/sites-enabled/rp.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/rp.conf
    - require:
      - file: /etc/nginx/sites-available/rp.conf

nginx_service:
  service.running:
    - name: nginx
    - enable: True
