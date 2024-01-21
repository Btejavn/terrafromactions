variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "my--rg"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "my-vm"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}
variable "nic" {
  description = "Network Interface IDs"
  type        = list(string)
  default     = ["my-nic"]
}
