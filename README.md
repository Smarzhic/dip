# Дипломный практикум в YandexCloud

## Регистрация доменного имени

- Зарегистрирован домен `ZHUKOPS.RU`
- Настроено управление DNS для домена `ZHUKOPS.RU`
>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/DNS.PNG)  

Созадн S3 bucket YC аккаунте.
>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/s3%20baket.png)  

## Развертывание инфраструктуры
Развертывание инфраструктуры производится командой `terraform apply` из каталога `Terraform` данного репозитория.

- `providers.tf` Содержит настройки для подклчюения к провайдеру.
- `variables.tf` Содержит переменную с зарезервированным статичным адресом. Данный адрес будет назначаться фронт/бастион инстансу.
- `network.tf` Содержит настройки сетей.
- `meta.txt` Содержит перечень пользователей и их открытые ключи которые будут создаваться в виртуальных машинах.
- `app.tf`, `gitlab.tf`, `monitoring.tf`. `MySQL.tf`, `runner.tf`, `zhukops.tf` Содержат манифесты для создание виртуальных машин в YC
>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/apply.png)
>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/yc.png)

## Установка Nginx и LetsEncrypt
Все необходимые роли находятся в каталоге `Ansible` и разделены по сервисам. Минимально необходимая версия `Ansible` 2.9. В файле `hosts` находится inventory для плейбуков.

- Первым следует выпоолнить playbook `front.yml`. Он установит и настроит `Nginx`, `LetsEncrypt`, службу `proxy`, `Node_Exporter` на front машину




