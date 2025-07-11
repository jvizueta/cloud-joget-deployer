output "vm_public_ip" {
  description = "Public IP from module"
  value       = module.vm.public_ip_address
}

output "joget_domain"{
  value      = "${var.record_set_name}.${var.dns_zone_name}"
} 
