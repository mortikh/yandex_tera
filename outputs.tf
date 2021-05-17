output "node1_external_ip" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "node2_external_ip" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}
