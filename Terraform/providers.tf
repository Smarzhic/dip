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
    key        = "./status.tfstate"
    access_key = "YCAJEBXuBu0G-gl5pA3uuFnZ6"
    secret_key = "YCPTz-Newict6xoXa0XbjHlQvPkE4uNfa_7DgimQ"

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