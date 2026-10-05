ldd /usr/lib/systemd/systemd-machined | grep -E 'systemd|not found'

rpm -qf /usr/lib/systemd/systemd-machined

ls -l /usr/lib/systemd/systemd-machined 

sudo systemctl restart systemd-machined

sudo systemctl status systemd-machined --no-pager -l
