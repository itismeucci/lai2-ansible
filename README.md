
# Setup
## Sul nuovo PC

- Se necessario, impostare il layout della tastiera in italiano
- Configurare DHCP + static IP modificando il file `/etc/netplan/01-network-manager-all.yaml`

  ```
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

## Sul Control-node (dove è installato ansible)

- Popolare il file `hosts` con i corretti indirizzi IP
- Configurare `new_pc_default_hostname` in `hosts` inserendo l'hostname predefinito dei nuovi PC
- Eseguire i seguenti comandi
  ```
  ansible-galaxy collection install community.general
  ansible-galaxy install pixelart.chrome
  ansible-playbook -i hosts.yml -l lai2 --verbose --ask-vault-pass -K setup.yml
  ```
- Preparare il template per la home di `informatica` e di `itismeucci` su un PC e distribuirli (vedi sotto).
- Registrare la macchina virtuale su Virtualbox
  ```
  ansible-playbook -i hosts -l lai2 --verbose -K registervm.yml
  ```

# Distribuire il template per la home di 'informatica'

Configurare `informatica_template_master` in `hosts` ed eseguire

```
ansible-playbook -i hosts -l lai2 --verbose -K informatica.yml
```

`informatica_template_master` è l'host da dove prelevare la home di template per `informatica`

# Modificare e distribuire la macchia wirtuale Win10 (Win10.vdi ~20GB) e il template per la home di 'itismeucci'

- accedere al PC con itismeucci
- rimuovere fullscreen con CTRL+f
- aprire il terminale e killare il processo /home/itismeucci/win10.sh
- spengere Windows
- su Virtual Media Manager impostare il disco Win10.vdi come "normal"
- "release" e "remove" lo "snapshot" creato sul disco Win10.vdi
- aprire le impostazione della macchina virtuale Win10 e riattaccare il disco vdi
- avviare la macchina virtuale
- se necessario sloggarsi da itismeucci e loggarsi come admin
- effettuare tutte le modifiche necessarie, compresi gli aggiornamenti di Windows
- spengere Windows
- da Virtual Media Manager rendere il disco immutabile (verrà rilasciato)
- ricollegare il disco alla virtual machine
- distribuire il VDI:

  Configurare `itismeucci_template_master` in `hosts` ed eseguire
  ```
  ansible-playbook -i hosts -l lai2 --verbose -K itismeucci.yml
  ```

  `itismeucci_template_master` è l'host da dove prelevare la home di template per `itismeucci`

# Utility
```
ansible lai2 -i ./hosts -m reboot -K -b
ansible lai2 -i ./hosts -m community.general.shutdown -K -b
```
