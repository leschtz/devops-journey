# libvirt

This document contains information about qemu, kvm, libvirt, `virsh` and the `virt-*` tools.


## Tasks

### Show IP Addresses of VMS

```sh 
virsh net-list # display all network interfaces
virsh net-dhcp-leases $NETWORK_NAME # use 'default'
```

### Clone a VM

```sh
virsh list --all # select vm to clone
virsh suspend $VM_TO_CLONE # if vm is running

# use --auto-clone to setup files automatically
# use --file to select a new destination for any image. Needs to be used multiple times for any mounted image.
virt-clone --original $VM_TO_CLONE --name $CLONED_VM_NAME --auto-clone 


virsh start $CLONED_VM_NAME
virsh resume $VM_TO_CLONE 
```


## Links

- [Setup libvirt XML Without Starting VM](https://serverfault.com/questions/919538/do-not-start-guest-after-virt-install)

