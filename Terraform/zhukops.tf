resource "yandex_compute_instance" "zhukops" {
  name     = "zhukops"
  hostname = "zhukops.ru"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8fte6bebi857ortlja"
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.subnet-1.id
    nat            = true
    nat_ip_address = var.yc_reserved_ip
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}