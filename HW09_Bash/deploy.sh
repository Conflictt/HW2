cat << EOF | sudo tee /etc/systemd/system/bashlog.service
[Unit]
Description=send mail with result of parsing logfile
After=network.target
[Service]
ExecStart=/bin/bash /usr/local/etc/bashlog.sh
Type=simple
[Install]
WantedBy=multi-user.target
EOF

cat << EOF | sudo tee /etc/systemd/system/bashlog.timer
[Unit]
Description=Run every 6 seconds
[Timer]
OnBootSec=1m
OnUnitActiveSec=6s
Unit=bashlog.service
[Install]
WantedBy=timers.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable bashlog.service
sudo systemctl enable bashlog.timer
sudo systemctl start bashlog.timer
