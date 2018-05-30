# RaspberryPiVM

This repository contains a Raspberry Pi vm, it is sometimes good to have an ARMv6 machine for testing or development.

GUI:
![alt tag](https://raw.githubusercontent.com/romanzaikin/RaspberryPiVM/master/gui.PNG)

Lite:
![alt tag](https://raw.githubusercontent.com/romanzaikin/RaspberryPiVM/master/lite.PNG)

To configure vm all you have to do is:

1. download the following images files and place it in same folder with this git project.

1.1. http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2017-07-05/2017-07-05-raspbian-jessie-lite.zip

1.2. http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/2017-04-10-raspbian-jessie.zip

2. apt-get install qemu-system
3. chmod +x boot.sh
4. chmod +x boot_ui.sh
5. chmod +x boot_ui_net.sh
6. chmod +x boot_net.sh

To run the vm you have 4 options:

1. run boot_ui.sh to run a Raspberry Pi machine with a desktop.
2. run boot_ui_net.sh to run a Raspberry Pi machine with a desktop and network.
3. run boot.sh to run a Raspberry Pi lite Machine.
4. run boot.sh to run a Raspberry Pi lite Machine and network.

Both contains the default username/password of rasppbery pi which is pi/raspberry.

To connect to the machine make sure ssh is running by using:

```
service ssh start
```

From the host machine you can connect to the machine by using the following command:

```
ssh pi@127.0.0.1 -p 2222
```

On the other hand you can create a tunnel and allow remote machine to connect thru.

1. on the host machine use the following command to create the tunnel:
```
ssh -N -L 1337:127.0.0.1:22 pi@127.0.0.1 -p 2222 -g
```

2. on the remote machine just connect to the host machine ip and port 1337
```
ssh pi@192.168.56.101 -p 1337
```

If you want to connect your raspberry pi to the internet via the host machine you will have to pass the network thru you host machine to the vm

1. install tap interface on your host machine

1.1.apt-get install uml-utilities							# tunctl tool 

1.2. tunctl -t tap0 -u root									# start tap0 interface and assign it do id 0(root)

1.3. ifconfig tap0 172.30.0.1/24							# set ip address on the tap0 interface

1.4. sysctl net.ipv4.ip_forward=1							# forward the traffic back to the interface

1.5. iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE	# start the nat table

2. run raspberry pi image with network *_net.sh and then configure the interface in the raspberry pi image

2.1. ifconfig eth0 172.30.0.2/24

2.2. route add default gw 172.30.0.1

2.3. add nameserver 1.1.1.1 to /etc/resolv.conf				# configure DNS server 


* if you have problem with keybaord layout, here is a nice solution:
https://thepihut.com/blogs/raspberry-pi-tutorials/25556740-changing-the-raspberry-pi-keyboard-layout

Have fun,