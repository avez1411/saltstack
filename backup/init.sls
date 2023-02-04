move_script:
  file.managed:
    - name: /tmp/backup.sh
    - source: salt://backup/files/backup.sh
#    - user: master
#    - group: master
    - mode: 755

/tmp/:
  cron.present:
    - name: bash /tmp/backup.sh
    - user: root
    - minute: 00
    - hour: 23
    
