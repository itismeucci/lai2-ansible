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
ansible-playbook -i hosts --verbose -K setup.yml 
```

# Distribute 'informatica' home template

Configure the `informatica_template_master` in `hosts` and run

```
ansible-playbook -i hosts --verbose -K informatica.yml
```

`informatica_template_master` is the host from where to get `informatica` template

# Utility
```
ansible lai2 -i ./hosts -m reboot -K -b
ansible lai2 -i ./hosts -m community.general.shutdown -K -b
```
