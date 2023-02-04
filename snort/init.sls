install_snort:
  pkg.installed:
    - pkgs:
      - snort

snort_conf:
  file.managed:
    - name: /etc/snort/snort.conf
    - user: root
    - group: snort 
    - mode: 640
    - source: salt://snort/files/snort.conf

rules_files:
  file.managed:
    - name: /etc/snort/rules/local.rules
    - user: root
    - group: root
    - mode: 644
    - source: salt://snort/files/local.rules

running_cmd:
  cmd.run:
    - name: sudo snort -q -Q -c /etc/snort/snort.conf --daq afpacket -i ens33:ens36 -K ASCII -A full
    - runas: root
