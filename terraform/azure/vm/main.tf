
module "vm" {
  source = "./modules/vm"

  resource_group_name       = var.resource_group_name
  location                  = var.location
  vnet_name                 = var.vnet_name
  vnet_address_space        = var.vnet_address_space
  subnet_name               = var.subnet_name
  subnet_address_prefix     = var.subnet_address_prefix
  public_ip_name            = var.public_ip_name
  public_ip_allocation      = var.public_ip_allocation
  nic_name                  = var.nic_name
  ip_config_name            = var.ip_config_name
  private_ip_allocation     = var.private_ip_allocation
  vm_name                   = var.vm_name
  vm_size                   = var.vm_size
  admin_username            = var.admin_username
  ssh_pub_key_path          = var.ssh_pub_key_path
  image_publisher           = var.image_publisher
  image_offer               = var.image_offer
  image_sku                 = var.image_sku
  image_version             = var.image_version
  os_disk_name              = var.os_disk_name
  os_disk_caching           = var.os_disk_caching
  os_disk_storage_account_type = var.os_disk_storage_account_type
  computer_name             = var.computer_name
  dns_zone_name             = var.dns_zone_name
  dns_zone_rg               = var.dns_zone_rg
  record_set_name           = var.record_set_name
  public_ip_sku             = var.public_ip_sku
}

resource "local_file" "ansible_group_vars" {
  content  = templatefile("${path.module}/../../../ansible/templates/all.yml.tpl", {
    joget_domain = "${var.record_set_name}.${var.dns_zone_name}"
  })
  filename = "${path.module}/../../../ansible/group_vars/all.yml"
}



