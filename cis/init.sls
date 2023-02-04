install_iptables:
  pkg.installed:
    - pkgs:
      - iptables
      - iptables-persistent

run_script:
  cmd.script:
    - name: iptablehard.sh
    - runas: root
    - source: salt://cis/files/iptablehard.sh

