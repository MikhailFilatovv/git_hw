# Домашнее задание к занятию «Кеширование Redis/memcached» Филатов Михаил

---

### Задание 1. Кеширование 

Приведите примеры проблем, которые может решить кеширование. 

*Приведите ответ в свободной форме.*


### Решение 1. Кеширование

- Повышение производительности за счет скорости обработки обращения приложения к часто используемым данным в "быструю" память.
- Сглаживание бустов трафика во время пиковых нагрузок на БД.
- Повышаем скорость ответа БД на тяжеловесные запросы, за счет кэширования оптимизируем ресурсы затраченные на эти запросы.

### Задание 2. Memcached

Установите и запустите memcached.

*Приведите скриншот systemctl status memcached, где будет видно, что memcached запущен.*

### Ответ 2. Memcached

![skrin](https://github.com/MikhailFilatovv/git_hw/blob/main/img/cache_skrn1.png)

### Задание 3. Удаление по TTL в Memcached

Запишите в memcached несколько ключей с любыми именами и значениями, для которых выставлен TTL 5. 

*Приведите скриншот, на котором видно, что спустя 5 секунд ключи удалились из базы.*

### Ответ 3. Удаление по TTL в Memcached

![skrin](https://github.com/MikhailFilatovv/git_hw/blob/main/img/cache_skrn2.png)

### Задание 4. Запись данных в Redis

Запишите в Redis несколько ключей с любыми именами и значениями. 

*Через redis-cli достаньте все записанные ключи и значения из базы, приведите скриншот этой операции.*

### Задание 5*. Работа с числами 

Запишите в Redis ключ key5 со значением типа "int" равным числу 5. Увеличьте его на 5, чтобы в итоге в значении лежало число 10.  

*Приведите скриншот, где будут проделаны все операции и будет видно, что значение key5 стало равно 10.*


### Ответ 4 и 5*. Запись данных в Redis

![skrin](https://github.com/MikhailFilatovv/git_hw/blob/main/img/cache_skrn3.png)