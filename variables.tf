variable "vm_tshirt_size" {
  description = "T-shirt size for the VM"
  type        = string
  default     = "small"
}

variable "vm_size_map" {
  description = "Map of t-shirt sizes to Azure VM sizes"
  type        = map(string)
  default = {
    small  = "Standard_B1s"
    medium = "Standard_B2s"
    large  = "Standard_B4ms"
    xlarge = "Standard_B8ms"
  }
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "nntp-vm"
}

variable "vm_username" {
  description = "Username for the VM"
  type        = string
  default     = "debian"
}

variable "ssh_public_key" {
  description = "SSH public key for the VM"
  type        = string
}
