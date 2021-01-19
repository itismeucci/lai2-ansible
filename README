# Setup
ansible-galaxy collection install community.general
ansible-playbook setup.yaml -i hosts --verbose -K

# Utility
ansible lai2 -i ./hosts -m reboot -K -b
ansible lai2 -i ./hosts -m community.general.shutdown -K -b
