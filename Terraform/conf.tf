terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-object-storage-tutorial"
    region     = "ru-central1"
    key        = "<./status.tfstate"
    access_key = "YCAJEoLs55AoyIdrXXK_YyXHs"
    secret_key = "YCMT7swnXNmzrkf5DooFMQmMt0K98cJPjNCSUXH5"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = "AQAAAAAC4MaKAATuwZJwI2spT0PcsrYJjIKur5g"
  cloud_id  = "b1gh6f39i3rar8gfmq7s"
  folder_id = "b1g646h5plbol72hkkki"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
