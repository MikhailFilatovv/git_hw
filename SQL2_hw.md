# Домашнее задание к занятию "`SQL. Часть 2`" - Филатов Михаил

### Задание 1

`Задание 1
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:`

- `фамилия и имя сотрудника из этого магазина;`
- `город нахождения магазина;`
- `количество пользователей, закреплённых в этом магазине.`

### Решение 1

```sql
SELECT CONCAT(s3.first_name, ' ', s3.last_name)  AS 'employee_name', c.city AS City, COUNT(c2.store_id) 
FROM staff s3 
INNER JOIN store s ON s.store_id = s3.store_id
INNER JOIN address a ON a.address_id = s3.address_id
INNER JOIN city c ON c.city_id  = a.city_id
INNER JOIN customer c2 ON c2.store_id = s3.store_id
GROUP BY s3.staff_id
HAVING COUNT(c2.store_id) > 300;
```

![Скриншот 1](img/sql2_skrn1.png)
---

### Задание 2

`Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.`

### Решение 2

```sql
SELECT COUNT(f.film_id) AS 'Count_of_films'
FROM film f
WHERE f.`length` > (SELECT AVG(`length`) FROM film f);
```
![Скриншот 1](img/sql2_skrn2.png)
---

### Задание 3

`Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.`

### Решение 3

```sql
SELECT 
	SUM(p.amount) AS 'summ', 
	DATE_FORMAT(p.payment_date, '%Y-%m') AS 'monthly_revenue', 
	COUNT(r.rental_id) AS 'total_rent' 
FROM payment p
INNER JOIN rental r ON p.rental_id = r.rental_id 
GROUP BY monthly_revenue
ORDER BY summ DESC
LIMIT 1;
```

![Скриншот 1](img/sql2_skrn3.png)
---

