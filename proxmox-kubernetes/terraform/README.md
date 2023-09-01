A Terraform provider is responsible for understanding API interactions and exposing resources. The Proxmox provider uses the Proxmox API. This provider exposes two resources: proxmox_vm_qemu and proxmox_lxc.

Creating the Proxmox user and role for terraform
The particular privileges required may change but here is a suitable starting point rather than using cluster-wide Administrator rights

Log into the Proxmox cluster or host using ssh (or mimic these in the GUI) then:

Create a new role for the future terraform user.
Create the user "terraform-prov@pve"
Add the TERRAFORM-PROV role to the terraform-prov user
pveum role add TerraformProv -privs "Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt"
pveum user add terraform-prov@pve --password <password>
pveum aclmod / -user terraform-prov@pve -role TerraformProv
The provider also supports using an API key rather than a password, see below for details.

After the role is in use, if there is a need to modify the privileges, simply issue the command showed, adding or removing privileges as needed.

pveum role modify TerraformProv -privs "Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt"
For more information on existing roles and privileges in Proxmox, refer to the vendor docs on PVE User Management