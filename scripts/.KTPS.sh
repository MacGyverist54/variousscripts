for k in /usr/lib/modules/*; do
	echo
	echo "===== $k ====="
	find  "$k" -type f \( \
		-name 'rndis_host.ko*' -o \
                -name 'cdc_ether.ko*' -o \
                -name 'usbnet.ko*'  \
	\) -print
done
