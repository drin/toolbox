#!/usr/bin/bash


# Setup services that I almost always want running

sudo dhcpcd --rebind enp7s0 # lower ethernet
sudo zpool import raiddata
run_keybase -a

# Setup permissions and misc for VMs
sudo chown drin /dev/sdg* /dev/sdf

# Setup private kinetic network
sudo ip link set enp0s25 up
sudo ip addr add 10.23.90.1/24 dev enp0s25
sudo iptables-restore /etc/iptables/skytether.rules

# Don't forget to set ip_forward to 1
# Also, start dhcpd when desired
