DEV=$(basename "$(readlink -f /sys/bus/usb/devices/1-3)" 2>/dev/null)
echo "USB DEVICE: $DEV"

echo "=== Interfaces ==="
for i in /sys/bus/usb/devices/1-3:*; do
	[ -e "$i" ] || continue
	echo
	echo "--- $i ---"
	cat "$i/bInterfaceNumber"  2>/dev/null
	cat "$i/bInterfaceClass" 2>/dev/null
        cat "$i/bInterfaceSubClass" 2>/dev/null
        cat "$i/bInterfaceProtocol" 2>/dev/null
	readlink "$i/driver" 2>/dev/null || echo "NO DRIVER"
	cat "$i/modalias" 2>/dev/null
done

echo
echo "=== RNDIS DRIVER REGISTRATION ==="
ls  -lah /sys/bus/usb/drivers/rndis_host  2>&1

echo 
echo "=== CDC ETHER DRIVER REGISTRATION ===" 
ls  -lah /sys/bus/usb/drivers/cdc_ether 2>&1
