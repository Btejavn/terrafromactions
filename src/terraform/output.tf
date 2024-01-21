output "vm_name" {
  description = "The name of the created virtual machine"
  value       = azurerm_windows_virtual_machine.vm.name
}

output "vm_public_ip" {
  description = "The public IP address of the virtual machine"
  value       = azurerm_windows_virtual_machine.vm.public_ip_address
}

output "nic_id" {
  description = "The ID of the created network interface"
  value       = azurerm_network_interface.nic.id
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = var.resource_group_name
}
