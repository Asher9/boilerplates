# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "your-vm" {
    
    # VM General Settings
    target_node = "your-proxmox-node"
    vmid = "100"
    name = "vm-name"
    desc = "Description"

    # VM Advanced General Settings
    # onboot = true 

    # VM OS Settings
    clone = "ubuntu-server-jammy"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 2
    sockets = 1
    cpu = "x86-64-v2-AES"
    bios = "ovmf"
    scsihw = "virtio-scsi-pci"
    
    # VM Memory Settings
    memory = 2048

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
        tag = 40
    }

    disk {
        storage = "internrow1"
        type = "virtio"
        size = "20G"
    } 

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    loudinit_cdrom_storage = "internrow1"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    ipconfig0 = "ip=dhcp"
    
    # (Optional) Default User
    ciuser = "dev"
    
    # (Optional) Add your SSH KEY
    # sshkeys = <<EOF
    # #YOUR-PUBLIC-SSH-KEY
    # EOF
}