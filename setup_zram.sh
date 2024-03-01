
#/bin/bash

# Set up zram mount for /home/user1
# refer to: https://www.kernel.org/doc/html/latest/admin-guide/blockdev/zram.html
#           https://wiki.archlinux.org/title/Zram

# RUN ALL THE FOLLOWING COMMANDS AS ROOT

modprobe zram
# list zram devices
zramctl

# add additional zram device
cat /sys/class/zram-control/hot_add

zramctl /dev/zram1 --algorithm zstd --size 2G

# check fdisk to make sure new device is visible
# fdisk -l

mkfs.ext4 /dev/zram1

mount /dev/zram1 /home/user1
chown user1:user1 /home/user1
