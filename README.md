# Дипломный практикум в YandexCloud

## Регистрация доменного имени

- Зарегистрирован домен `ZHUKOPS.RU`
- Настроено управление DNS для домена `ZHUKOPS.RU`
>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/DNS.PNG)  

Создан S3 bucket YC аккаунте.
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
Все необходимые роли находятся в каталоге `Ansible` и разделены по сервисам. Минимально необходимая версия `Ansible` 2.9. В файле `hosts` находится inventory для плейбуков и переменные для ansible ssh proxy.

- Первым следует выполнить playbook `front.yml`. Он установит и настроит `Nginx`, `LetsEncrypt`, службу `proxy`, `Node_Exporter` на front машину. Запросит и получит необходимые сертификаты.


Для переключения между `stage` и `prod` запросами сертификатов следует отредактировать таски с именем  Create letsencrypt certificate, в файле `Ansible\roles\Install_Nginx_LetsEncrypt\tasks\main.yml` добавив или удалив в них ключ `--staging` :
```
- name: Create letsencrypt certificate front
  shell: letsencrypt certonly -n --webroot --staging -w /var/www/letsencrypt -m {{ letsencrypt_email }} --agree-tos -d {{ domain_name }}
  args:
    creates: /etc/letsencrypt/live/{{ domain_name }}
```

## Установка кластера MySQL

- Теперь пора выполнить playbook `MySQL.yml`. В файле `Ansible\roles\Install_MySQL\defaults\main.yml` находятся настройки MySQL кластера. Дополнительно в файле `hosts` передаются переменные для настройки репликации базы  между db01 и db02. 


>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/MySQL.png)

Убедимся что репликация настроена и проходит успешно

>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/Replica.png)

## Установка WordPress

-  Для установки `WordPress` служит playbook `wordpress.yml`.  Playbook устанавливает и настраивает `nginx`, `memcached`, `php5`, `wordpress`. В файле `wordpress.yml` так же передаются переменные необходимые для корректной настройки wordpress.
```
  vars:
    - domain: "zhukops.ru"
    - download_url: "http://wordpress.org/latest.tar.gz"
    - wpdirectory: "/var/www"
```
>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/wp.png)

Теперь сайт zhukops.ru доступен по https

>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/zhukops.png)

## Установка Gitlab CE и Gitlab Runner

- Для установки Gitlab создан playbook `Gitlab`. Настройки данной роли вынесены в файл `Ansible\roles\Gitlub\defaults\main.yml` Выполнение данного плейбука может занять продолжительное время.

>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/gitlab.png)

Теперь локальный `Gitlab` теперь доступен по https:

>![PID 1](https://github.com/Smarzhic/dip/blob/main/img/gitweb.png)

Данные для входа -root/5iveL!fe. Если не удается залогиниться с указанными учетными данными следует на инстансе gitlab.zhukops.ru выполнить команду `sudo gitlab-rake "gitlab:password:reset[root]"` которая сбросит пароль пользователя root и запросит новый.

- Для установки Gitlab Runner следует выполнить playbook - `Runner`


