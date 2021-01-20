#!/bin/bash
sleep 2
VBoxManage startvm Win10
sleep 10
vbox_pid=`pidof VirtualBoxVM`
while [[ -d /proc/$vbox_pid ]]; do sleep 1; done; shutdown -h now
