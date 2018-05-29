#!/bin/bash
qemu-system-arm -kernel qemu-rpi-kernel/kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda 2017-07-05-raspbian-jessie-lite.img -redir tcp:2222::22 -net nic -net tap,ifname=tap0,script=no,downscript=no -no-reboot
