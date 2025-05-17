terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-b"
  token = var.yc_token
  cloud_id = var.yc_cloud_id
  folder_id = var.yc_folder_id 
}

resource "yandex_vpc_network" "net" {
  name = "tf_net"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "tf_subnet"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance" "vm" {
  name        = "tf-vm"
  platform_id = "standard-v3"
  zone        = "ru-central1-b"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      size     = 20
      type     = "network-hdd"
      image_id = "fd866d9q7rcg6h4udadk"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

output "vm_ip" {
  value = yandex_compute_instance.vm.network_interface.0.nat_ip_address
}