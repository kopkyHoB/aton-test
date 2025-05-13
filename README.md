# Задание 1 

Template nginx.conf в /task1/templates

Playbook и log в /task1

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