# Configure DHCP + static IP
```
# /etc/netplan/01-network-manager-all.yaml 

# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp1s0:
      dhcp4: yes
      dhcp6: yes
      addresses:
        - 10.1.1.1/24
```


# Setup
```
ansible-galaxy collection install community.general
ansible-galaxy install pixelart.chrome
ansible-playbook setup.yaml -i hosts --verbose -K
```

# Utility
```
ansible lai2 -i ./hosts -m reboot -K -b
ansible lai2 -i ./hosts -m community.general.shutdown -K -b
```
