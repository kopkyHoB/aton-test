# Задание 1 

Template nginx.conf в /task-1/templates

Playbook и log в /task-1

Запуск playbook:
```bash
sudo ansible-playbook ansible-playbook.yml 
```

# Задание 2

Файлы *dockerfile*, *docker-compose.yml* лежат в /task-2

Сертификат и ключ лежат в /task-2/certs

HTML лежит в /task-2/html

Создадим сертификат и приватный ключ, которые потом окажутся в контейнере:

```bash
openssl req -nodes -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
```
Билд и запуск *docker-file.yml*

```bash
docker-compose up -d --build
```

# Задание 3

Файл скрипта лежит в /task-3

Для реализации была настроена отправка почты через ssmtp

Файл конфигурации *ssmtp.conf*

```
root=example@yandex.ru
mailhub=smtp.yandex.ru:465
AuthUser=example@yandex.ru
AuthPass=pass
UseTLS=YES
UseSTARTTLS=NO
RewriteDomain=yandex.ru
Hostname=smtp.yandex.ru:465
FromLineOverride=YES
```

Файл *revaliases*

```
user:example@yandex.ru
root:example@yandex.ru:smtp.yandex.ru:465
```

# Задание 3

Файлы скриптов для *deploy* и *build*, файлы логов и *.yml* файл пайплайна лежат в /task-4

Задание было реализовано при помощи GitHub Actions

Сам репо, который использовался для реализации: https://github.com/kopkyHoB/test-repo/