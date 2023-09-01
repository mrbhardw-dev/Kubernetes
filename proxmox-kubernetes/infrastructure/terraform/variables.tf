variable "pm_api_url" {
  default = "https://192.168.0.100:8006/api2/json"
}
variable "pm_node" {
  default = "Proxmox"
}

variable "pm_user" {
  default = "terraform-prov@pve"
}

variable "pm_password" {
  default = "P@ssw0rd@123"
}


variable "ssh_key_file" {
  default = "~/.ssh/id_rsa.pub"
}