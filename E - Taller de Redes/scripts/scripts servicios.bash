[Unit]
Description=Cargar reglas iptables al bootear
Before=network.target

[Service]
ExecStart=/init/iptables-init.sh
Type=oneshot
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target

################################

[Unit]
Description=Levantar servicios al bootear
After=network.target

[Service]
ExecStart=/init/services-init.sh
Type=oneshot

[Install]
WantedBy=multi-user.target