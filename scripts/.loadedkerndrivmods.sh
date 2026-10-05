K=$(uname -r)
echo "RUNNING: $K"

find  /usr/lib/modules/"$K" -type f \
	\( -name 'rndis_host.ko*' -o \
	 -name 'cdc_ether.ko*' -o \
	 -name 'usbnet.ko*' \) \
	-print

echo "=== kernel module  packaages ==="
rpm -qa |  grep -E "^kernel-(core|modules|modules-core|modules-extra)-" | sort
