# Дипломный практикум в YandexCloud

## Регистрация доменного имени

- Зарегистрирован домен `ZHUKOPS.RU`
- Настроено управление DNS для домена `ZHUKOPS.RU`

## Создание инфраструктуры

Манифесты инфраструктуры описаны в каталоге `Terraform`

## Установка Nginx и LetsEncrypt
 - Необходимо разработать Ansible роль для установки Nginx и LetsEncrypt  
 - Необходимо разработать Ansible роль для установки кластера MySQ
 - Необходимо разработать Ansible роль для установки WordPress
 - Установка Gitlab CE и Gitlab Runner
 - Необходимо разработать Ansible роль для установки Prometheus, Alert Manager и Grafana

Роли распологаются в каталоге `Ansible`

Для корректной работы WP по HTTPS добавить в конф WP
```
define( 'WP_SITEURL', 'https://example.com/blog' );
define( 'WP_HOME', 'https://example.com/blog' );
```