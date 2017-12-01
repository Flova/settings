VALUE=$(cat </sys/class/backlight/acpi_video0/brightness)
VALUE1=$(($VALUE+1))
echo $VALUE1 > /sys/class/backlight/acpi_video0/brightness