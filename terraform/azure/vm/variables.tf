variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for resources"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address prefix for the Subnet"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Public IP"
  type        = string
}

variable "public_ip_allocation" {
  description = "Allocation method for the Public IP"
  type        = string
}

variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
}

variable "ip_config_name" {
  description = "Name of the IP configuration"
  type        = string
}

variable "private_ip_allocation" {
  description = "Private IP allocation method"
  type        = string
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for SSH access"
  type        = string
}

variable "ssh_pub_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "image_publisher" {
  description = "Publisher of the VM image"
  type        = string
}

variable "image_offer" {
  description = "Offer of the VM image"
  type        = string
}

variable "image_sku" {
  description = "SKU of the VM image"
  type        = string
}

variable "image_version" {
  description = "Version of the VM image"
  type        = string
}

variable "os_disk_name" {
  description = "Name of the OS disk"
  type        = string
}

variable "os_disk_caching" {
  description = "Caching type for OS disk"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "Storage account type for OS disk"
  type        = string
}

variable "computer_name" {
  description = "Computer name inside the VM"
  type        = string
}

variable "dns_zone_name" {
  description = "Public DNS Zone name"
  type        = string
}

variable "dns_zone_rg" {
  description = "Resource group of the Public DNS Zone"
  type        = string
}

variable "record_set_name" {
  description = "Subdomain / Name of the VM recordset"
  type        = string
}

variable "public_ip_sku" {
  description = "SKU for the Public IP"
  type        = string
}
