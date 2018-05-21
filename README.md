# RaspberryPiVM

This repository contains a Raspberry Pi vm, it is sometimes good to have an ARMv6 machine for testing or development.

GUI:
![alt tag](https://raw.githubusercontent.com/romanzaikin/RaspberryPiVM/master/gui.PNG)

Lite:
![alt tag](https://raw.githubusercontent.com/romanzaikin/RaspberryPiVM/master/lite.PNG)

To configure vm all you have to do is:

1. download the following images:
1.1. http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2017-07-05/2017-07-05-raspbian-jessie-lite.zip
1.2. http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/2017-04-10-raspbian-jessie.zip
2. apt-get install qemu-system
3. chmod +x boot.sh
4. chmod +x boot_ui.sh

To run the vm you have 2 options:

1. run boot_ui.sh to run a Raspberry Pi machine with a desktop.
2. run boot.sh to run a Raspberry Pi lite Machine.

both contains the default username/password of rasppbery pi which is pi/raspberry.

to connect to the machine make sure ssh is running by using:

```
service ssh start
```

from the host machine you can connect to the machine by using the following command:

```
ssh pi@127.0.0.1 -p 2222
```

