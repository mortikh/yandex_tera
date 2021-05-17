resource "local_file" "hosts_config" {
  content = templatefile("${path.module}/templates/hosts.tpl",
    {
      master = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
      workers = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
    }
  )
  filename = "playbook/hosts"
}
