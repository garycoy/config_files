#!/bin/bash
#

setfont sun12x22

set -o vi

systemctl enable pcscd
systemctl start pcscd

systemctl enable cronie
systemctl start cronie

systemctl enable ntpd
systemctl start ntpd

systemctl enable cups 
systemctl start cups 

systemctl enable opensnitchd 
systemctl start opensnitchd 

echo ""
echo "----------------------------"
echo "Set password for user1 user:"
passwd user1

echo ""
echo "----------------------------"
echo "Set root password:"
passwd root

# Note this file will not exist. Need to add it
cd /usr/share/dbus-1/services
echo "[D-BUS Service]" > org.freedesktop.Notifications.service
echo "Name=org.freedesktop.Notifications" >> org.freedesktop.Notifications.service
echo "Exec=/usr/lib/notification-daemon-1.0/notification-daemon" >> org.freedesktop.Notifications.service

# Run hwclock(8) to generate /etc/adjtime:
hwclock --systohc

# Localization
# Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed locales. Generate the locales by running:

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen

# Create the locale.conf(5) file, and set the LANG variable accordingly:
echo "LANG=en_US.UTF-8" > /etc/locale.conf

