# Дипломный практикум в YandexCloud

## Регистрация доменного имени

- Зарегистрирован домен `ZHUKOPS.RU`
- Настроено управление DNS для домена `ZHUKOPS.RU`
>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/DNS.PNG)  

Созадн S3 bucket YC аккаунте.
>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/s3%20baket.png)  

Развертывание инфраструктуры производится командой `terraform apply` из каталога `Terraform` данного репозитория.

- `providers.tf` Содержит настройки для подклчюения к провайдеру.
- `variables.tf` Содержит переменную с зарезервированным статичным адресом. Данный адрес будет назначаться фронт/бастион инстансу.
- `network.tf` Содержит настройки сетей.
- `meta.txt` Содержит перечень пользователей и их открытые ключи которые будут создаваться в виртуальных машинах.


## Установка Nginx и LetsEncrypt
 - Необходимо разработать Ansible роль для установки Nginx и LetsEncrypt  
 - Необходимо разработать Ansible роль для установки кластера MySQ
 - Необходимо разработать Ansible роль для установки WordPress
 - Установка Gitlab CE и Gitlab Runner
 - Необходимо разработать Ansible роль для установки Prometheus, Alert Manager и Grafana

Роли распологаются в каталоге `Ansible`
