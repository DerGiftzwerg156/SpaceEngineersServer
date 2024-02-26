FROM devidian/spaceengineers:latest

#Config Datei kopieren
COPY server-config.cfg /conf/SpaceEngineers-Dedicated.cfg

COPY entrypoint.sh /root/
ENTRYPOINT /root/entrypoint.sh